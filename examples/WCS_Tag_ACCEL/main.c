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
#include "uart.h"
//#include "TWI.h"
#include "LIS2DH12.h"
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

/* Preamble timeout, in multiple of PAC size. See NOTE 3 below. */
#define PRE_TIMEOUT 1000

/* Delay between frames, in UWB microseconds. See NOTE 1 below. */
#define POLL_TX_TO_RESP_RX_DLY_UUS 100 

/*Should be accurately calculated during calibration*/
#define TX_ANT_DLY 16300
#define RX_ANT_DLY 16456	

/* Dummy buffer for DW1000 wake-up SPI read. See NOTE 2 below. */
#define DW1000_SS 17
#define READY_PIN 25
//rtc time
#define RTC_PERIOD 8//rtc run with f=1/8 Hz
#define DWT_PERIOD 10//dwt active
#define DWT_PERID_MODE_ACCEL 60*30//10s
#define ACCEL_DETECT_INACTIVE_PERIOD 10 //detect tag inactive in 10s
//--------------dw1000---end---------------
static volatile uint8 flag_sleep=0;
static bool volatile flag_inactive=false;
uint32 tick;
volatile uint8 count=0;
static volatile bool boInterruptEvent = false;
 void SysTick_Handler(void)  {
     if(++tick == 500) {
         nrf_gpio_pin_toggle(LED_1); /* light LED 2 very 1 second */
         tick = 0;
     }
 }
 // Local function declarations
static void vInterruptInit ();
static void vInterruptHandler();
void twi_off();
static void wake_dwt1000();
int main(void)
{ 
   nrf_gpio_pin_write(DW1000_SS,0);
   nrf_delay_ms(2);
   nrf_gpio_pin_write(DW1000_SS,1);
  /* Reset DW1000 */
  reset_DW1000(); 

  /* Set SPI clock to 2MHz */
  port_set_dw1000_slowrate();			
  //dwt_spicswakeup(dummy_buffer, DUMMY_BUFFER_LEN);

  //dwt_readdevid();
  /* Init the DW1000 */
  nrf_gpio_pin_write(DW1000_SS,0);
  nrf_delay_ms(2);
  nrf_gpio_pin_write(DW1000_SS,1);
  if (dwt_initialise(DWT_LOADUCODE) == DWT_ERROR)
  {
    //Init of DW1000 Failed
    while (1) {};
  }
  // Set SPI to 8MHz clock
  port_set_dw1000_fastrate();

  /* Configure DW1000. */
  dwt_configure(&config);

  /* Apply default antenna delay value. See NOTE 2 below. */
  dwt_setrxantennadelay(RX_ANT_DLY);
  dwt_settxantennadelay(TX_ANT_DLY);
  dwt_configuresleep(DWT_PRESRV_SLEEP | DWT_CONFIG, DWT_WAKE_CS | DWT_SLP_EN);
  rtc_init();
  vTWI_Init();
  vInterruptInit();
  vLIS2_Init();
  vLIS2_EnableInactivityDetect();
  vTWI_Stop();
  while (1)
  {
      if(ss_init_run()==1)
      {
        count++;
         if(count>2)
        {
        
         dwt_entersleep();
         flag_sleep=1;
         NRF_RTC0->TASKS_START = 1;
         NRF_CLOCK->TASKS_HFCLKSTOP = 1;
         while(flag_sleep==1)
         {
           __WFE();
           __SEV();
	   __WFE(); 
         }
         wake_dwt1000();
	// Restart the hi-frequency clock
        NRF_CLOCK->EVENTS_HFCLKSTARTED = 0;
	NRF_CLOCK->TASKS_HFCLKSTART = 1;
	while(NRF_CLOCK->EVENTS_HFCLKSTARTED == 0);	
        }
      }
  }
}

void rtc_init()
{
    // Start LFCLK (32kHz) crystal oscillator. If you don't have crystal on your board, choose RCOSC instead.
  NRF_CLOCK->LFCLKSRC = CLOCK_LFCLKSRC_SRC_Xtal << CLOCK_LFCLKSRC_SRC_Pos;
  NRF_CLOCK->TASKS_LFCLKSTART = 1;
  while (NRF_CLOCK->EVENTS_LFCLKSTARTED == 0);
  NRF_CLOCK->EVENTS_LFCLKSTARTED = 0;
  // 32kHz timer period
  NRF_RTC0->PRESCALER = 4095;
  //  30.5ms us compare value, generates EVENTS_COMPARE[0]
  NRF_RTC0->CC[0] = 10*RTC_PERIOD;

  // Enable EVENTS_COMPARE[0] generation
  NRF_RTC0->EVTENSET = RTC_EVTENSET_COMPARE0_Enabled << RTC_EVTENSET_COMPARE0_Pos;
  // Enable IRQ on EVENTS_COMPARE[0]
  NRF_RTC0->INTENSET = RTC_INTENSET_COMPARE0_Enabled << RTC_INTENSET_COMPARE0_Pos;

  // Enable RTC IRQ and start the RTC
  NVIC_EnableIRQ(RTC0_IRQn);
  NVIC_SetPriority(RTC0_IRQn,7);
//  NRF_RTC0->TASKS_START = 1;
}
void RTC0_IRQHandler(void)
{
  if (NRF_RTC0->EVENTS_COMPARE[0] == 1)
  {
    NRF_RTC0->EVENTS_COMPARE[0] = 0;
    flag_sleep=0;
    count=0;
    NRF_RTC0->TASKS_STOP=1;
    NRF_RTC0->TASKS_CLEAR=1;
   // printf("rtc %d \n\r",flag_inactive);
  }
}
static void vInterruptHandler()
{
       vTWI_Init();
       uint8 u8Status=u8LIS2_EventStatus();
       if (u8Status & (XHIE | YHIE | ZHIE))
       {
	 vLIS2_EnableInactivityDetect();
        // printf("motion\n\r");
         NRF_RTC0->TASKS_CLEAR=1;
         NRF_RTC0->CC[0]= DWT_PERIOD*RTC_PERIOD;
        // flag_inactive=false;
       }
       else // Assume low threshold (plus delay) detected
       {
	 vLIS2_EnableWakeUpDetect();
         //flag_inactive=true;
         NRF_RTC0->TASKS_CLEAR=1;
         NRF_RTC0->CC[0]= DWT_PERID_MODE_ACCEL*RTC_PERIOD;
         //printf("not motion\n\r");
       }
       vTWI_Stop();
}
/*!
* @brief Configure an IO pin as a positive edge triggered interrupt source.
*/
static void vInterruptInit (void)
{
	ret_code_t err_code;
	boInterruptEvent = false;
	
	if (nrf_drv_gpiote_is_init())
		//printf("nrf_drv_gpiote_init already installed\n");
                nrf_delay_ms(10);
	else
		nrf_drv_gpiote_init();

	// input pin, +ve edge interrupt, no pull-up
	nrf_drv_gpiote_in_config_t in_config = GPIOTE_CONFIG_IN_SENSE_LOTOHI(true);
	in_config.pull = NRF_GPIO_PIN_NOPULL;

	// Link this pin interrupt source to its interrupt handler
	err_code = nrf_drv_gpiote_in_init(READY_PIN, &in_config, vInterruptHandler);
	APP_ERROR_CHECK(err_code);
	nrf_drv_gpiote_in_event_enable(READY_PIN, true);
}
static void wake_dwt1000()
{
   nrf_gpio_pin_write(DW1000_SS,0);
   nrf_delay_ms(2);
   nrf_gpio_pin_write(DW1000_SS,1);
   dwt_setrxantennadelay(RX_ANT_DLY);
   dwt_settxantennadelay(TX_ANT_DLY);
}