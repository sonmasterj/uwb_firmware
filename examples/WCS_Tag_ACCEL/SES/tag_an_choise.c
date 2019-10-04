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
//#include "nrf_drv_timer.h"
#include "SEGGER_RTT.h"
#include "uart.h"
#include "nrf_drv_gpiote.h"
#include "nrf_timer.h"
#include "LIS2DH12.h"
#define TRX_PRE_CODE 3
#define PRF 	DWT_PRF_16M
#define SFD_TIMEOUT 256
#define PRE_LEN  DWT_PLEN_256
//-----------------dw1000----------------------------
static dwt_config_t config = {
    5,                /* Channel number. */
    PRF,      /* Pulse repetition frequency. */
    PRE_LEN,     /* Preamble length. Used in TX only. */
    DWT_PAC8,         /* Preamble acquisition chunk size. Used in RX only. */
    TRX_PRE_CODE,               /* TX preamble code. Used in TX only. */
    TRX_PRE_CODE,               /* RX preamble code. Used in RX only. */
    0,                /* 0 to use standard SFD, 1 to use non-standard SFD. */
    DWT_BR_6M8,       /* Data rate. */
    DWT_PHRMODE_STD,  /* PHY header mode. */
    (SFD_TIMEOUT+1 + 8 - 8)     /* SFD timeout (preamble length + 1 + SFD length - PAC size). Used in RX only. */
};

/* Preamble timeout, in multiple of PAC size. See NOTE 3 below. */
#define PRE_TIMEOUT 1000

/* Delay between frames, in UWB microseconds. See NOTE 1 below. */
#define POLL_TX_TO_RESP_RX_DLY_UUS 100 

/*Should be accurately calculated during calibration*/
#define TX_ANT_DLY 16300
#define RX_ANT_DLY 16456	

/* beacon frame message for anchor 1*/
#define ALL_MESS_ID 7
#define ALL_MSG_SN_IDX 2
#define BN_CLUSTER_NUM 10
#define BN_CLUSTER_MAP 11
#define BN_DATA_MAP 15
#define BEACON_TYPE 0x10
#define ALL_MSG_COMMON_LEN 7
#define MESS_TYPE 9
/* TDMA superframe*/
#define TAG_SLOT 0
static uint8_t beacon[]={0x41,0x88,0,0x11,0x22,0xFF,0xFF,0x00,0x02,BEACON_TYPE,0,1,0,0,0,0,0,0,0};
/* twr frame */
/* Frames used in the ranging process. See NOTE 2,3 below. */
static uint8 rx_poll_msg[] = {0x41, 0x88, 0, 0x11, 0x22, 0xff, 0xff, 0,0, 0xE0,TAG_SLOT,0,0,0,0,0, 0};
static uint8 tx_resp_msg[] = {0x41, 0x88, 0, 0x11, 0x22, 0xff, 0xff, 0x00, 0x01, 0xE1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
static uint8 iot_range_msg[]={0x41, 0x88, 0, 0x11, 0x22, 0xff, 0xff,TAG_SLOT,TAG_SLOT,0x63,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
uint8 counter_an=0;
#define POLL_TYPE 0xE0
#define TAG_ADDR 10
#define AN_TWR0 11
#define AN_TWR1 12
#define AN_TWR2 13
#define AN_TWR3 14
//iot msg
#define RESP_POLL 0xE1
#define IOT_RANGE 0x63
#define AN1_RANGE 10
#define AN2_RANGE 12
#define AN3_RANGE 14
#define AN4_RANGE 16
#define AN1_ADDR 18
#define AN2_ADDR 19
#define AN3_ADDR 20
#define AN4_ADDR 21
#define ANCHOR_NUM 4
#define RESP_MSG_POLL_RX_TS_IDX 11
#define RESP_MSG_RESP_TX_TS_IDX 15
#define RESP_MSG_TS_LEN 4	
#define REST_MSG_DES_ADD 5

/* Buffer to store received response message*/
#define RX_BUF_LEN 30
static uint8 rx_buffer[RX_BUF_LEN];
/* Frame count*/
static uint8 frame_seq_nb = 0;
/* system reg status */
static uint32 status_reg = 0;
/* time stamp variable*/
//typedef unsigned long long uint64;
//typedef signed long long int64;
//typedef unsigned long long uint64;
//static uint64 poll_tx_ts;
#define POLL_RX_TO_RESP_TX_DLY_UUS  1100
#define RESP_TX_TO_FINAL_RX_DLY_UUS 500
#define UUS_TO_DWT_TIME 65536
#define ANCHOR_TWR_TIME 1000
#define TWR_TIME 60 //6 ms
#define TWR_PHASE 300//30 ms of 100ms
/* TDMA superframe*/
//--------------dw1000---end---------------

//Led
#define RED_LED_PIN LED_1

// systick config
 #define SYSTICK_COUNT_ENABLE        1
 #define SYSTICK_INTERRUPT_ENABLE    2
 #define SYSTICK_PER 10000 //100 us incr
static uint32_t tick=0;
//flag event
#define TICK_COUNT_REINIT 20000//2s
uint8 flag_twr=0;
uint8 flag_sync_err=0;
static bool volatile  flag_sleep=false;
//static bool volatile flag_inactive=false;
//TWR variable
#define ANCHOR_NUM 4
#define SPEED_OF_LIGHT 299702547
#define TWR_FAIL_MAX 5
#define TWR_SUCC_MAX 3
static double tof;
static uint16 distance[ANCHOR_NUM];
static uint8 anchor_addr[ANCHOR_NUM];
static uint8 anchor_twr[ANCHOR_NUM];
static uint8 anchor_sync;
static uint8 twr_fail=0;
static uint8 twr_succ=0;
//end TWR
//INTERRUPT PIN
#define DW1000_SS 17
#define READY_PIN 25
//rtc time
#define RTC_PERIOD 8//rtc run with f=1/8 Hz
#define DWT_PERIOD 3//dwt active
#define DWT_PERID_MODE_ACCEL 60//10s
#define ACCEL_DETECT_INACTIVE_PERIOD 10 //detect tag inactive in 10s
uint8_t tag_add[2];
void init_phase();
static void vInterruptInit ();
static void vInterruptHandler();
static void wake_dwt1000();
static void rtc_init();
static uint64 get_rx_timestamp_u64(void)
{
  uint8 ts_tab[5];
  uint64 ts = 0;
  int i;
  dwt_readrxtimestamp(ts_tab);
  for (i = 4; i >= 0; i--)
  {
    ts <<= 8;
    ts |= ts_tab[i];
  }
  return ts;
}
void SysTick_Handler(void)  {
     tick++;
     if(tick==TWR_PHASE+TAG_SLOT*TWR_TIME-anchor_sync*10)
     {
      flag_twr=1;
     } 
     else if(tick>TICK_COUNT_REINIT)
     {
       flag_sync_err=1;
     }
 }
static void resp_msg_set_ts(uint8 *ts_field, const uint32 ts, uint8 len_data)
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
void poll_send()
{
    dwt_syncrxbufptrs();
    dwt_write8bitoffsetreg(SYS_CTRL_ID, SYS_CTRL_OFFSET, (uint8)SYS_CTRL_TRXOFF) ;
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
    rx_poll_msg[ALL_MSG_SN_IDX] = frame_seq_nb;
    dwt_writetxdata(sizeof(rx_poll_msg), rx_poll_msg, 0); /* Zero offset in TX buffer. */
    dwt_writetxfctrl(sizeof(rx_poll_msg), 0, 1); /* Zero offset in TX buffer, ranging. */
    dwt_starttx(DWT_START_TX_IMMEDIATE); 
    dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
    frame_seq_nb ++;  
}
void dw1000_init()
{
  //wake dw1000
//   nrf_gpio_pin_write(DW1000_SS,0);
//   nrf_delay_ms(2);
//   nrf_gpio_pin_write(DW1000_SS,1);
  /* Reset DW1000 */
  reset_DW1000(); 

  /* Set SPI clock to 2MHz */
  port_set_dw1000_slowrate();			
  nrf_gpio_pin_write(DW1000_SS,0);
  nrf_delay_ms(2);
  nrf_gpio_pin_write(DW1000_SS,1);
  /* Init the DW1000 */
  if (dwt_initialise(DWT_LOADUCODE) == DWT_ERROR)
  {
    //Init of DW1000 Failed
    while (1) {};
  }
//   printf("init succ\n\r");
  // Set SPI to 8MHz clock
  port_set_dw1000_fastrate();

  /* Configure DW1000. */
  dwt_configure(&config);
  /* Apply default antenna delay value. See NOTE 2 below. */
  dwt_setrxantennadelay(RX_ANT_DLY);
  dwt_settxantennadelay(TX_ANT_DLY);
  dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
  dwt_configuresleep(DWT_PRESRV_SLEEP | DWT_CONFIG, DWT_WAKE_CS | DWT_SLP_EN);
  uint32_t iotID = dwt_getlotid();
  tag_add[0]=iotID & 0xFF;
  tag_add[1]=(iotID>>8) & 0xFF;
  rx_poll_msg[7]=tag_add[0];
  rx_poll_msg[8]=tag_add[1];
  iot_range_msg[7]=tag_add[0];
  iot_range_msg[8]=tag_add[1];
}
int main(void)
{
    /*Initialization UART*/
   // boUART_Init ();
   //NRF_POWER->SYSTEMOFF=1;
    nrf_gpio_cfg_output(RED_LED_PIN);
    dw1000_init();
    rtc_init();
    vTWI_Init();
    vInterruptInit();
    vLIS2_Init();
    vLIS2_EnableInactivityDetect();
    vTWI_Stop();
    SysTick_Config(SystemCoreClock /SYSTICK_PER); 
init:    init_phase();
    while(1)
   {
     if(flag_twr==1) 
     {
       poll_send();
       flag_twr=0;
       goto lp;
     }
     if(flag_sync_err==1)
     {
       tick=0;
       goto init;
     }
     dwt_rxenable(DWT_START_RX_IMMEDIATE);
     while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG | SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR)))
     {
       if(flag_twr==1) 
       {
         poll_send();
         flag_twr=0;
         goto lp;
       }
       if(flag_sync_err==1)
       {
         tick=0;
         goto init;
       }
     }
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
       if(rx_buffer[MESS_TYPE]==BEACON_TYPE && rx_buffer[3]==0x11 && rx_buffer[BN_CLUSTER_NUM]==anchor_sync)
       {
          tick=0; 
          counter_an=0;
     //     printf("resync\n\r");
         
       }
       else if(rx_buffer[MESS_TYPE]=RESP_POLL && rx_buffer[5]==TAG_SLOT && rx_buffer[3]==0x11)
      {
         uint32 poll_tx_ts, resp_rx_ts, poll_rx_ts, resp_tx_ts;
         int32 rtd_init, rtd_resp;
         float clockOffsetRatio ;
         counter_an++;
         anchor_addr[counter_an-1]=rx_buffer[10];
        /* Retrieve poll transmission and response reception timestamps. See NOTE 5 below. */
        
        resp_rx_ts=dwt_readrxtimestamplo32();
        poll_tx_ts=dwt_readtxtimestamplo32();
        /* Read carrier integrator value and calculate clock offset ratio. See NOTE 7 below. */
        clockOffsetRatio = dwt_readcarrierintegrator() * (FREQ_OFFSET_MULTIPLIER * HERTZ_TO_PPM_MULTIPLIER_CHAN_5 / 1.0e6) ;

        /* Get timestamps embedded in response message. */
        resp_msg_get_ts(&rx_buffer[RESP_MSG_POLL_RX_TS_IDX], &poll_rx_ts,4);
        resp_msg_get_ts(&rx_buffer[RESP_MSG_RESP_TX_TS_IDX], &resp_tx_ts,4);

        /* Compute time of flight and distance, using clock offset ratio to correct for differing local and remote clock rates */
        rtd_init = resp_rx_ts - poll_tx_ts;
        rtd_resp = resp_tx_ts - poll_rx_ts;

        tof = ((rtd_init - rtd_resp * (1.0f - clockOffsetRatio)) / 2.0f) * DWT_TIME_UNITS; // Specifying 1.0f and 2.0f are floats to clear warning 
        distance[counter_an-1] =(uint16)(tof * SPEED_OF_LIGHT *100)-26;
       // printf("%d %d\n\r",distance[counter_an-1],anchor_addr[counter_an-1]);
        if(counter_an==ANCHOR_NUM)  
        {
          twr_fail=0;
          twr_succ++;
          //if(anchor_addr[0]==anchor_twr[0] && anchor_addr[1]==1 && anchor_addr[2]==2 && anchor_addr[3]==3) 
          if (memcmp(anchor_addr, anchor_twr, ANCHOR_NUM) == 0)
          {
            dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
            iot_range_msg[ALL_MSG_SN_IDX] = frame_seq_nb;
            resp_msg_set_ts(&iot_range_msg[AN1_RANGE], distance[0],2);
            resp_msg_set_ts(&iot_range_msg[AN2_RANGE], distance[1],2);
            resp_msg_set_ts(&iot_range_msg[AN3_RANGE], distance[2],2);
            resp_msg_set_ts(&iot_range_msg[AN4_RANGE], distance[3],2);
            iot_range_msg[AN1_ADDR]=anchor_addr[0];
            iot_range_msg[AN2_ADDR]=anchor_addr[1];
            iot_range_msg[AN3_ADDR]=anchor_addr[2];
            iot_range_msg[AN4_ADDR]=anchor_addr[3];
            dwt_writetxdata(sizeof(iot_range_msg), iot_range_msg, 0); /* Zero offset in TX buffer. */
            dwt_writetxfctrl(sizeof(iot_range_msg), 0, 1); /* Zero offset in TX buffer, ranging. */
            dwt_starttx(DWT_START_TX_IMMEDIATE); 
            frame_seq_nb ++; 
            //printf("done\n\r");
           }
        }
        else
        {
          twr_fail++;
          if(twr_fail==TWR_FAIL_MAX)
          {
            twr_succ=0;
            goto init;
          }
        }
      }
    }
    else
     {
       lp: dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR);
     }
    if(twr_succ==TWR_SUCC_MAX)
    {
      dwt_entersleep();
      flag_sleep=true;
      NRF_RTC0->TASKS_START = 1;
      NRF_CLOCK->TASKS_HFCLKSTOP = 1;
      while(flag_sleep==true)
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
      init_phase();
    }
  }
}
void init_phase()
{
   uint8 anchor_list[30];
   uint8 cnt_anchor=0;
   //tao danh sach cac anchor nghe thay
listen:   while(tick<=2000)
   {
     dwt_rxenable(DWT_START_RX_IMMEDIATE);
     /* Poll for reception of a frame or error/timeout. See NOTE 5 below. */
     while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG | SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR)))
     {
       if(tick>2000) break;
     }
     if (status_reg & SYS_STATUS_RXFCG)
     {
       uint32 frame_len_init_phase;
       dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_RXFCG);
       frame_len_init_phase = dwt_read32bitreg(RX_FINFO_ID) & RX_FINFO_RXFL_MASK_1023;
       if (frame_len_init_phase <= RX_BUFFER_LEN)
       {
         dwt_readrxdata(rx_buffer, frame_len_init_phase, 0);
       }
       if(rx_buffer[MESS_TYPE]==BEACON_TYPE && rx_buffer[3]==0x11)
       {
         cnt_anchor++;
         anchor_list[cnt_anchor-1]=rx_buffer[BN_CLUSTER_NUM];
        // printf("%d \n\r",anchor_list[cnt_anchor-1]);
       }
     }
     else
     {
       dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR);
     }
   }
   if(cnt_anchor>0)
  {
   //chon loc danh sach anchor va chon ra anchor dong bo theo, 4 anchor ket noi cung
   for (char i = 1; i < cnt_anchor; i++)
    for (char j = 0; j < i; j++)
    {
      if (anchor_list[i] == anchor_list[j])
      {
        for (char k = i; k < cnt_anchor; k++) anchor_list[k] = anchor_list[k + 1];
        cnt_anchor--;
        i--;
      }
    }
    //sap xep mang tang dan
   char temp;
   for(char i=0;i<cnt_anchor-1;i++)
   {
     for(char j=i+1;j<cnt_anchor;j++)
     {
       if(anchor_list[i]>anchor_list[j])
       {
         temp=anchor_list[i];
         anchor_list[i]=anchor_list[j];
         anchor_list[j]=temp;
       }
     }
   }
   //chon anchor de dong bo va chonn 4 anchor thuc hien twr
   anchor_sync=anchor_list[0];
   anchor_twr[0]=anchor_list[0];
   anchor_twr[1]=anchor_list[1];
   anchor_twr[2]=anchor_list[2];
   anchor_twr[3]=anchor_list[3];
   //add dia chi 4 anchor vao ban tin group poll
   rx_poll_msg[AN_TWR0]=anchor_twr[0];
   rx_poll_msg[AN_TWR1]=anchor_twr[1];
   rx_poll_msg[AN_TWR2]=anchor_twr[2];
   rx_poll_msg[AN_TWR3]=anchor_twr[3];
   twr_fail=0;
   flag_sync_err=0;
  }
  else 
  {
     tick=0;
   // printf("not anchor\n\r");
    goto listen;
  }
}
void rtc_init()
{
  // Start LFCLK (32kHz) crystal oscillator. If you don't have crystal on your board, choose RCOSC instead.
  NRF_CLOCK->LFCLKSRC = CLOCK_LFCLKSRC_SRC_Xtal << CLOCK_LFCLKSRC_SRC_Pos;
  NRF_CLOCK->TASKS_LFCLKSTART = 1;
  while (NRF_CLOCK->EVENTS_LFCLKSTARTED == 0);
  NRF_CLOCK->EVENTS_LFCLKSTARTED = 0;
  // 8Hz timer period
  NRF_RTC0->PRESCALER = 4095;
  //  30.5ms us compare value, generates EVENTS_COMPARE[0]
  NRF_RTC0->CC[0] = DWT_PERIOD*RTC_PERIOD;
  // Enable EVENTS_COMPARE[0] generation
  NRF_RTC0->EVTENSET = RTC_EVTENSET_COMPARE0_Enabled << RTC_EVTENSET_COMPARE0_Pos;
  // Enable IRQ on EVENTS_COMPARE[0]
  NRF_RTC0->INTENSET = RTC_INTENSET_COMPARE0_Enabled << RTC_INTENSET_COMPARE0_Pos;
  // Enable RTC IRQ and start the RTC
  NVIC_EnableIRQ(RTC0_IRQn);
  NVIC_SetPriority(RTC0_IRQn,7);
}
void RTC0_IRQHandler(void)
{
  if (NRF_RTC0->EVENTS_COMPARE[0] == 1)
  {
    NRF_RTC0->EVENTS_COMPARE[0] = 0;
    flag_sleep=false;
    twr_succ=0;
    NRF_RTC0->TASKS_STOP=1;
    NRF_RTC0->TASKS_CLEAR=1;
   // printf("rtc\n\r");
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
       }
       else // Assume low threshold (plus delay) detected
       {
	 vLIS2_EnableWakeUpDetect();
         NRF_RTC0->TASKS_CLEAR=1;
         NRF_RTC0->CC[0]= DWT_PERID_MODE_ACCEL*RTC_PERIOD;
        // printf("not motion\n\r");
       }
       vTWI_Stop();
}
static void vInterruptInit (void)
{
  ret_code_t err_code;
  if (nrf_drv_gpiote_is_init())
    nrf_delay_ms(1);
  else
    nrf_drv_gpiote_init();
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
   nrf_delay_ms(3);
   dwt_setrxantennadelay(RX_ANT_DLY);
   dwt_settxantennadelay(TX_ANT_DLY);
}