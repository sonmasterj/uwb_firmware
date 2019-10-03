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
#include "nrf_drv_gpiote.h"
//-----------------dw1000----------------------------
static dwt_config_t config = {
    5,                /* Channel number. */
    DWT_PRF_16M,      /* Pulse repetition frequency. */
    DWT_PLEN_256,     /* Preamble length. Used in TX only. */
    DWT_PAC8,         /* Preamble acquisition chunk size. Used in RX only. */
    3,               /* TX preamble code. Used in TX only. */
    3,               /* RX preamble code. Used in RX only. */
    0,                /* 0 to use standard SFD, 1 to use non-standard SFD. */
    DWT_BR_6M8,       /* Data rate. */
    DWT_PHRMODE_STD,  /* PHY header mode. */
    (256+1 + 8 - 8)     /* SFD timeout (preamble length + 1 + SFD length - PAC size). Used in RX only. */
};
static dwt_txconfig_t txconfig = {
    0xC0,            /* PG delay. */
    0x1f1f1f1f,      /* TX power. */
};
/* Preamble timeout, in multiple of PAC size. See NOTE 3 below. */
#define PRE_TIMEOUT 1000

/* Delay between frames, in UWB microseconds. See NOTE 1 below. */
#define POLL_TX_TO_RESP_RX_DLY_UUS 100 

/*Should be accurately calculated during calibration*/
#define TX_ANT_DLY 16300
#define RX_ANT_DLY 16456	

/* beacon frame message*/
#define ALL_MESS_ID 9
#define ALL_MSG_SN_IDX 2
#define BN_SESSION_ID 10
#define BN_CLUSTER_NUM 11
#define BN_CLUSTER_MAP 12
#define BN_DATA_MAP 16
#define BEACON_TYPE 0x10
static uint8_t beacon[]={0x41,0x88,0,0x11,0x22,0xFF,0xFF,0x00,0x01,BEACON_TYPE,0,0,0,0,0,0,0,0,0,0};

/* Buffer to store received response message*/
#define RX_BUF_LEN 30
static uint8 rx_buffer[RX_BUF_LEN];

/* Frame count*/
static uint8 frame_seq_nb = 0;
/* system reg status */
static uint32 status_reg = 0;
//--------------dw1000---end---------------

//Led
#define RED_LED_PIN LED_1

// systick config
 #define SYSTICK_COUNT_ENABLE        1
 #define SYSTICK_INTERRUPT_ENABLE    2
 #define SYSTICK_PER 10000 //100 us incr
static volatile uint32_t tick=0;
static void rx_ok_cb(const dwt_cb_data_t *cb_data);
//interrupt systick
 void SysTick_Handler(void)  {
     tick++;
     if(tick==1000) tick=0;
 }
 //insert and take data to/from rf buffer
static void beacon_msg_set_ts(uint8 *ts_field, const uint32 ts, uint8 len_data)
{
  int i;
  for (i = 0; i < len_data; i++)
  {
    ts_field[i] = (ts >> (i * 8)) & 0xFF;
  }
}
static void resp_msg_get_ts(uint8 *ts_field, uint32 *ts, uint8 len_data)
{
  int i;
  *ts = 0;
  for (i = 0; i < len_data; i++)
  {
    *ts += ts_field[i] << (i * 8);
  }
}
//end of insert and take data to/from rf buffer

//
void beacon_send()
{
    nrf_gpio_pin_toggle(RED_LED_PIN);
    beacon[ALL_MSG_SN_IDX] = frame_seq_nb;
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
    dwt_writetxdata(sizeof(beacon), beacon, 0); /* Zero offset in TX buffer. */
    dwt_writetxfctrl(sizeof(beacon), 0, 1); /* Zero offset in TX buffer, ranging. */
    dwt_starttx(DWT_START_TX_IMMEDIATE);
    frame_seq_nb ++;
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
}
uint32_t beacon_rx()
{
   dwt_rxenable(DWT_START_RX_DELAYED);
  /* Poll for reception of a frame or error/timeout. See NOTE 5 below. */
  while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG | SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR)))
  {};
  if (status_reg & SYS_STATUS_RXFCG)
  {
    uint32 frame_len;
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
   // resp_msg_get_ts(&rx_buffer[BEACON_MSG_RX_TS_IDX], &beacon_tx_ts);
//    if (memcmp(rx_buffer, becon, ALL_MSG_COMMON_LEN) == 0)
//    {
//        
//    }
  }
  else
  {
    /* Clear RX error events in the DW1000 status register. */
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_ALL_RX_ERR);
    /* Reset RX to properly reinitialise LDE operation. */
    dwt_rxreset();
  }
}
void dw1000_init()
{
   /* Setup DW1000 IRQ pin */  
  nrf_gpio_cfg_input(DW1000_IRQ, NRF_GPIO_PIN_NOPULL); 		//irq
  //printf("Singled Sided Two Way Ranging Initiator Example \r\n");
  /* Reset DW1000 */
  reset_DW1000(); 

  /* Set SPI clock to 2MHz */
  port_set_dw1000_slowrate();			
  
  /* Init the DW1000 */
  if (dwt_initialise(DWT_LOADUCODE) == DWT_ERROR)
  {
    //Init of DW1000 Failed
    while (1) {};
  }

  // Set SPI to 8MHz clock
  port_set_dw1000_fastrate();

  /* Configure DW1000. */
  dwt_configure(&config);
   dwt_setsmarttxpower(1) ;
  dwt_configuretxrf(&txconfig);
  /* Apply default antenna delay value. See NOTE 2 below. */
  dwt_setrxantennadelay(RX_ANT_DLY);
  dwt_settxantennadelay(TX_ANT_DLY);

  /* Set preamble timeout for expected frames. See NOTE 3 below. */
 // dwt_setpreambledetecttimeout(0); // PRE_TIMEOUT
          
  /* Set expected response's delay and timeout. */
  //dwt_setrxaftertxdelay(POLL_TX_TO_RESP_RX_DLY_UUS);
  dwt_setrxtimeout(5000); // Maximum value timeout with DW1000 is 65ms  
  
}

int main(void)
{
    /*Initialization UART*/
    boUART_Init ();
    nrf_gpio_cfg_output(RED_LED_PIN);
    dw1000_init();
    SysTick_Config(SystemCoreClock /SYSTICK_PER);  
    while (1)
     { 
       if(tick==10)
       {
         beacon_send();   
       }
     }
}