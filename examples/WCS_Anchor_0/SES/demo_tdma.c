/* Copyright (c) 2015 Nordic Semiconductor. All Rights Reserved.
 *
 * The information contained herein is property of Nordic Semiconductor ASA.
 * Terms and conditions of usage are described in detail in NORDIC
 * SEMICONDUCTOR STANDARD SOFTWARE LICENSE AGREEMENT.
 *
 * Licensees are granted free, non-transferable use of the information. NO
 * WARRANTY of ANY KIND is provided. This heading must NOT be removed from
 * the file.
 *
 */

#include "sdk_config.h"
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "bsp.h"
#include "boards.h"
#include "nordic_common.h"
#include "nrf_drv_clock.h"
#include "nrf_drv_spi.h"
#include "nrf_uart.h"
#include "app_util_platform.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"
#include "nrf_log.h"
#include "nrf.h"
#include "app_error.h"
#include "app_util_platform.h"
#include "app_error.h"
#include <string.h>
#include "port_platform.h"
#include "deca_types.h"
#include "deca_param_types.h"
#include "deca_regs.h"
#include "deca_device_api.h"
#include "nrf_drv_timer.h"
#include "SEGGER_RTT.h"
#include "uart.h"
	
//-----------------dw1000----------------------------

static dwt_config_t config = {
    5,                /* Channel number. */
    DWT_PRF_64M,      /* Pulse repetition frequency. */
    DWT_PLEN_128,     /* Preamble length. Used in TX only. */
    DWT_PAC8,         /* Preamble acquisition chunk size. Used in RX only. */
    10,               /* TX preamble code. Used in TX only. */
    10,               /* RX preamble code. Used in RX only. */
    0,                /* 0 to use standard SFD, 1 to use non-standard SFD. */
    DWT_BR_6M8,       /* Data rate. */
    DWT_PHRMODE_STD,  /* PHY header mode. */
    (129 + 8 - 8)     /* SFD timeout (preamble length + 1 + SFD length - PAC size). Used in RX only. */
};

/* Preamble timeout, in multiple of PAC size. See NOTE 3 below. */
#define PRE_TIMEOUT 1000

/* Delay between frames, in UWB microseconds. See NOTE 1 below. */
#define POLL_TX_TO_RESP_RX_DLY_UUS 100 

/*Should be accurately calculated during calibration*/
#define TX_ANT_DLY 16300
#define RX_ANT_DLY 16456	

/* beacon frame message*/
static uint8 rx_beacon_msg[] ={0x41, 0x88, 0, 0xCA, 0xDE, 'V', 'E', 'W', 'A', 0xE1, 0, 0,0,0,0,0};
/* index beacon frame */
#define ALL_MSG_SN_IDX 2
#define BEACON_MSG_RX_TS_IDX 10
#define BEACON_MSG_RX_LEN 4
#define ALL_MSG_COMMON_LEN 10
/* Buffer to store received response message*/
#define RX_BUF_LEN 20
static uint8 rx_buffer[RX_BUF_LEN];
/*frame count*/
static uint8 frame_seq_nb = 0;
/* Hold copy of status register state here for reference so that it can be examined at a debug breakpoint. */
static uint32 status_reg = 0;

//--------------dw1000---end---------------
#define TASK_DELAY        200           /**< Task delay. Delays a LED0 task for 200 ms */
#define TIMER_PERIOD      2000          /**< Timer period. LED1 timer will expire after 1000 ms */
#define RED_LED_PIN LED_0
uint32_t beacon_tx_ts=0,beacon_rx_ts=0;
uint16_t cnt=0;
#define TIMER_STAMP NRF_TIMER1
#define TIMER_CC_CHANNEL NRF_TIMER_CC_CHANNEL2
uint32_t time[2],offset,offset_sum=0, offset_mean=0;
uint32_t cnt_interrupt;
void timer1_init()
{
    NVIC_DisableIRQ(TIMER1_IRQn); // use "sd_nvic" prefix with softdevice
    
    nrf_timer_task_trigger(NRF_TIMER1, NRF_TIMER_TASK_STOP);
    nrf_timer_task_trigger(NRF_TIMER1, NRF_TIMER_TASK_CLEAR);
    
    nrf_timer_mode_set(NRF_TIMER1, NRF_TIMER_MODE_TIMER); 
    nrf_timer_bit_width_set(NRF_TIMER1, NRF_TIMER_BIT_WIDTH_32);
    nrf_timer_frequency_set(NRF_TIMER1, NRF_TIMER_FREQ_16MHz);
    nrf_timer_cc_write(NRF_TIMER1, NRF_TIMER_CC_CHANNEL0, 1600000);
    nrf_timer_int_enable(NRF_TIMER1, NRF_TIMER_INT_COMPARE0_MASK);
    nrf_timer_shorts_enable(NRF_TIMER1, NRF_TIMER_SHORT_COMPARE0_CLEAR_MASK); // self running
    
    NVIC_SetPriority(TIMER1_IRQn, 7); // use "sd_nvic" prefix with softdevice
    NVIC_EnableIRQ(TIMER1_IRQn); // use "sd_nvic" prefix with softdevice

   // nrf_timer_task_trigger(NRF_TIMER1, NRF_TIMER_TASK_START);

}
uint32 timestamp()
{
    nrf_timer_task_trigger(TIMER_STAMP,NRF_TIMER_TASK_CAPTURE2);
    return (nrf_timer_cc_read(TIMER_STAMP,TIMER_CC_CHANNEL));
}
void dw1000_init()
{
  /* Setup DW1000 IRQ pin */
  nrf_gpio_cfg_input(DW1000_IRQ, NRF_GPIO_PIN_NOPULL); 		//irq

  /* Reset DW1000 */
  reset_DW1000(); 

  /* Set SPI clock to 2MHz */
  port_set_dw1000_slowrate();			

  /* Init the DW1000 */
  if (dwt_initialise(DWT_LOADUCODE) == DWT_ERROR)
  {
    //Init of DW1000 Failed
    while (1)
    {};
  }

  // Set SPI to 8MHz clock
  port_set_dw1000_fastrate();  

  /* Configure DW1000. */
  dwt_configure(&config);

  /* Apply default antenna delay value. Defined in port platform.h */
  dwt_setrxantennadelay(RX_ANT_DLY);
  dwt_settxantennadelay(TX_ANT_DLY);

  /* Set preamble timeout for expected frames.  */
 // dwt_setpreambledetecttimeout(1);

  dwt_setrxtimeout(0);    // set to NO receive timeout for this simple example   

}
static void resp_msg_get_ts(uint8 *ts_field, uint32 *ts)
{
  int i;
  *ts = 0;
  for (i = 0; i <  BEACON_MSG_RX_LEN; i++)
  {
    *ts += ts_field[i] << (i * 8);
  }
}
uint32_t beacon_rx()
{
   dwt_rxenable(DWT_START_RX_IMMEDIATE);
  /* Poll for reception of a frame or error/timeout. See NOTE 5 below. */
  while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG | SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR)))
  {};
  beacon_rx_ts=timestamp();
  if (status_reg & SYS_STATUS_RXFCG)
  {
    uint32 frame_len;
    //cnt++;
   // if (cnt>2) cnt=0;
    /* Clear good RX frame event in the DW1000 status register. */
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_RXFCG);
    /* A frame has been received, read it into the local buffer. */
    frame_len = dwt_read32bitreg(RX_FINFO_ID) & RX_FINFO_RXFL_MASK_1023;
    if (frame_len <= RX_BUFFER_LEN)
    {
      dwt_readrxdata(rx_buffer, frame_len, 0);
    }
    /* Check that the frame is a poll sent by "SS TWR initiator" example*/
    rx_buffer[ALL_MSG_SN_IDX] = 0;
    resp_msg_get_ts(&rx_buffer[BEACON_MSG_RX_TS_IDX], &beacon_tx_ts);
//    if (memcmp(rx_buffer, beacon_rx_ts, ALL_MSG_COMMON_LEN) == 0)
//    {
//     
//    }
     time[cnt-1]=beacon_rx_ts;
   // printf("succes rx: %d %d\n",beacon_tx_ts,beacon_rx_ts);
  }
  else
  {
    /* Clear RX error events in the DW1000 status register. */
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_ALL_RX_ERR);
    /* Reset RX to properly reinitialise LDE operation. */
    dwt_rxreset();
  }
}
int main(void)
{
    /*Initialization UART*/
    boUART_Init ();
    nrf_gpio_cfg_output(RED_LED_PIN);
    timer1_init();
    dw1000_init();
    while (1)
    {
    }
}
void TIMER1_IRQHandler(void)
{
    if(NRF_TIMER1->EVENTS_COMPARE[0] == 1)
    {
       cnt_interrupt++;
       NRF_TIMER1->EVENTS_COMPARE[0] = 0;
       nrf_gpio_pin_toggle(RED_LED_PIN);  
    }
}
