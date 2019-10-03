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
#include "SEGGER_RTT.h"
#include "uart.h"
#include "nrf_drv_gpiote.h"
#include "nrf_fstorage.h"
#include "nrf_fstorage_nvmc.h"
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
#define BEACON_EXTERN_TYPE 0x13
#define BEACON_EXTERN_ADDR_AN 17
#define BEACON_EXTERN_SLOT_AN 19
#define ALL_MSG_COMMON_LEN 7
#define MESS_TYPE 9
#define REQUEST_SLOT_TYPE 0x12
#define REQUEST_SLOT 10
/*TDMA */
#define ANCHOR_SLOT 0
static uint8_t beacon[]={0x41,0x88,0,0x11,0x22,0xFF,0xFF,0x00,0x00,BEACON_TYPE,ANCHOR_SLOT,0,0,0,0,0,0,0,0};
static uint8_t beacon_extern[]={0x41,0x88,0,0x11,0x22,0xFF,0xFF,0x00,0x00,BEACON_EXTERN_TYPE,1,0,0,0,0,0,0,0,0,0,0,0};
static uint8_t request_mess[]={0x41,0x88,0,0x11,0x22,0xFF,0xFF,0,0,REQUEST_SLOT_TYPE,0,0,0};
static bool flag_becon_extern=false;
static uint8_t beacon_extern_num=0;
static bool flag_lock=false;
uint8_t anchor_slot_request;
static uint8_t anchor_addr_request[2];
static uint32_t anchor_slot_map;
/* twr frame */
/* Frames used in the ranging process. See NOTE 2,3 below. */
static uint8 rx_poll_msg[] = {0x41, 0x88, 0, 0x11, 0x22, 0xff, 0xff, 0x00, 0x00, 0xE0, 0,0,0,0,0,0, 0};
static uint8 tx_resp_msg[] = {0x41, 0x88, 0, 0x11, 0x22, 0xff, 0xff, 0x00, 0x00, 0xE1, ANCHOR_SLOT, 0, 0, 0, 0, 0, 0, 0, 0, 0,0};
#define POLL_TYPE 0xE0
#define POLL_TAG_SLOT 10
#define AN_TWR0 11
#define AN_TWR1 12
#define AN_TWR2 13
#define AN_TWR3 14
//
#define RESP_POLL 0xE1
#define RESP_MSG_ANCHOR_SLOT 10
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
typedef unsigned long long uint64;
static uint64 poll_rx_ts;
static uint64 resp_tx_ts;
#define POLL_RX_TO_RESP_TX_DLY_UUS  1100
#define RESP_TX_TO_FINAL_RX_DLY_UUS 500
#define UUS_TO_DWT_TIME 65536
#define TWR_TIME 60 //6 ms
#define TWR_PHASE 300//30 ms of 100ms

//--------------dw1000---end---------------

//Led
#define RED_LED_PIN LED_0

// systick config
 #define SYSTICK_COUNT_ENABLE        1
 #define SYSTICK_INTERRUPT_ENABLE    2
 #define SYSTICK_PER 10000 //10 us incr
static volatile uint32_t TICK_MAX=1000000;
static volatile uint32_t tick=0;
 volatile uint8 flag_sync=0;
 uint8 flag_twr=0;
 //flash variable
#define ADDR_FLASH  0x3e000
nrf_fstorage_api_t * p_fs_api;
unsigned char data_map[4]={1,0,0,0};
void beacon_send();
void anchor_init();
//funcion for flash read/write
static void fstorage_evt_handler(nrf_fstorage_evt_t * p_evt);
static uint32_t nrf5_flash_end_addr_get();
void wait_for_flash_ready(nrf_fstorage_t const * p_fstorage);
static uint32_t round_up_u32(uint32_t len);
static void fstorage_erase(uint32_t addr, uint32_t pages_cnt);
static void fstorage_write(uint32_t addr, void const * p_data);
NRF_FSTORAGE_DEF(nrf_fstorage_t fstorage) =
{
    /* Set a handler for fstorage events. */
    .evt_handler = fstorage_evt_handler,
    .start_addr = 0x3e000,
    .end_addr   = 0x3ffff,
};
//end flash 
 void SysTick_Handler(void)  {
     tick++;
     if(tick==1000) 
     {
       tick=0;
       flag_sync=1;
     }
 }
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
static void resp_msg_set_ts(uint8 *ts_field, const uint64 ts, uint8 len_data)
{
  int i;
  for (i = 0; i < len_data; i++)
  {
    ts_field[i] = (ts >> (i * 8)) & 0xFF;
  }
}
static void resp_msg_get_ts(uint8 *ts_field, uint64 *ts, uint8 len_data)
{
  int i;
  *ts = 0;
  for (i = 0; i < len_data; i++)
  {
    *ts += ts_field[i] << (i * 8);
  }
}
static void resp_msg_get_map(uint8 *ts_field, uint32 *ts, uint8 len_data)
{
  int i;
  *ts = 0;
  for (i = 0; i < len_data; i++)
  {
    *ts += ts_field[i] << (i * 8);
  }
}
void beacon_send()
{
    dwt_syncrxbufptrs();
    dwt_write8bitoffsetreg(SYS_CTRL_ID, SYS_CTRL_OFFSET, (uint8)SYS_CTRL_TRXOFF) ;
    if(flag_becon_extern==true)
    {
      beacon_extern_num++;
      beacon_extern[ALL_MSG_SN_IDX] = frame_seq_nb;
      beacon_extern[BEACON_EXTERN_ADDR_AN]=anchor_addr_request[0];
      beacon_extern[BEACON_EXTERN_ADDR_AN+1]=anchor_addr_request[1];
      beacon_extern[BEACON_EXTERN_SLOT_AN]=anchor_slot_request;
      dwt_writetxdata(sizeof(beacon_extern), beacon_extern, 0); /* Zero offset in TX buffer. */
      dwt_writetxfctrl(sizeof(beacon_extern), 0, 1); /* Zero offset in TX buffer, ranging. */
      dwt_starttx(DWT_START_TX_IMMEDIATE );
      dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
      frame_seq_nb ++;
      printf("beacon extern\n\r");
      if(beacon_extern_num==3)
      {
        flag_becon_extern=false;
        beacon_extern_num=0;
        flag_lock=false;
        printf("anchor requetst slot :%d\n\r",anchor_slot_request);
        anchor_slot_map|=(1<<anchor_slot_request);
        printf("slot map:%d\n\r",anchor_slot_map);   
            
        for(uint8 i=0;i<4;i++)
        {
          beacon[BN_CLUSTER_MAP+i]=(anchor_slot_map>> (i * 8)) & 0xFF;
          beacon_extern[BN_CLUSTER_MAP+i]=(anchor_slot_map>> (i * 8)) & 0xFF;
          data_map[i]=(anchor_slot_map>> (i * 8)) & 0xFF;
        }
        fstorage_write(0x3e000,data_map);
      }
    }
    else
    {

      beacon[ALL_MSG_SN_IDX] = frame_seq_nb;
      dwt_writetxdata(sizeof(beacon), beacon, 0); /* Zero offset in TX buffer. */
      dwt_writetxfctrl(sizeof(beacon), 0, 1); /* Zero offset in TX buffer, ranging. */
      dwt_starttx(DWT_START_TX_IMMEDIATE );
      dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
      frame_seq_nb ++;
      printf("beacon\n\r");
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
  //dwt_setsmarttxpower(1) ;
  //dwt_configuretxrf(&txconfig);
  /* Apply default antenna delay value. See NOTE 2 below. */
  dwt_setrxantennadelay(RX_ANT_DLY);
  dwt_settxantennadelay(TX_ANT_DLY);
}

int main(void)
{
    /*Initialization UART*/
    boUART_Init ();
    nrf_gpio_cfg_output(RED_LED_PIN);
    dw1000_init();
    //init flash
    p_fs_api = &nrf_fstorage_nvmc;
    nrf_fstorage_init(&fstorage, p_fs_api, NULL);
    nrf5_flash_end_addr_get();
    //fstorage_write(ADDR_FLASH,data_map);
    nrf_fstorage_read(&fstorage, 0x3e000, data_map,4);
    resp_msg_get_map(&data_map[0],&anchor_slot_map,4);
    printf("anchor map: %d\n\r",anchor_slot_map);
    for(uint8 i=0;i<4;i++)
    {
      beacon[BN_CLUSTER_MAP+i]=data_map[i];
      beacon_extern[BN_CLUSTER_MAP+i]=data_map[i];
    }
    //fstorage_write(0x3e000,data_map);
    SysTick_Config(SystemCoreClock /SYSTICK_PER);  
   while(1)
   {
     if(flag_sync==1) 
     {
       beacon_send();
       flag_sync=0;
       goto lp;
     }
     dwt_rxenable(DWT_START_RX_IMMEDIATE);
     /* Poll for reception of a frame or error/timeout. See NOTE 5 below. */
     while (!((status_reg = dwt_read32bitreg(SYS_STATUS_ID)) & (SYS_STATUS_RXFCG | SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR)))
     {
       if(flag_sync==1) 
       {
         beacon_send();
         flag_sync=0;
         goto lp;
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
       if(flag_lock==false && rx_buffer[MESS_TYPE]==REQUEST_SLOT_TYPE && rx_buffer[3]==0x11)
       {
         anchor_slot_request=rx_buffer[REQUEST_SLOT]; 
         if(((anchor_slot_map>>anchor_slot_request)&1)==0)
         {
           flag_lock=true;
           flag_becon_extern=true;
           anchor_addr_request[0]=rx_buffer[7];
           anchor_addr_request[1]=rx_buffer[8];
         }
       }
       if(rx_buffer[MESS_TYPE]==POLL_TYPE && rx_buffer[3]==0x11)
       {
         char twr_slot;
         for(char i=AN_TWR0;i<=AN_TWR3;i++)
         {
           if(rx_buffer[i]==ANCHOR_SLOT)
           {
             flag_twr=1;
             twr_slot=i-11;
             break;
           }
         }
         printf("twr slot %d\n\r",twr_slot);
         while(flag_twr==1)
         {
             uint32 resp_tx_time;
             uint8 tag_slot=rx_buffer[POLL_TAG_SLOT];
             poll_rx_ts = get_rx_timestamp_u64();
             resp_tx_time = (poll_rx_ts + ((POLL_RX_TO_RESP_TX_DLY_UUS+900*twr_slot) * UUS_TO_DWT_TIME)) >> 8;
             dwt_setdelayedtrxtime(resp_tx_time);
             resp_tx_ts = (((uint64)(resp_tx_time & 0xFFFFFFFEUL)) << 8) + TX_ANT_DLY;
             /* Write all timestamps in the final message. See NOTE 8 below. */
             resp_msg_set_ts(&tx_resp_msg[RESP_MSG_POLL_RX_TS_IDX], poll_rx_ts,4);
             resp_msg_set_ts(&tx_resp_msg[RESP_MSG_RESP_TX_TS_IDX], resp_tx_ts,4);
             /* Write and send the response message. See NOTE 9 below. */
             tx_resp_msg[ALL_MSG_SN_IDX] = frame_seq_nb;
             tx_resp_msg[5]=tag_slot;
             tx_resp_msg[6]=tag_slot;
             dwt_writetxdata(sizeof(tx_resp_msg), tx_resp_msg, 0); /* Zero offset in TX buffer. See Note 5 below.*/
             dwt_writetxfctrl(sizeof(tx_resp_msg), 0, 1); /* Zero offset in TX buffer, ranging. */
             int ret=dwt_starttx(DWT_START_TX_DELAYED);
             if (ret == DWT_SUCCESS)
             {
                 while (!(dwt_read32bitreg(SYS_STATUS_ID) & SYS_STATUS_TXFRS))
                 {};    
                 dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_TXFRS);
                 frame_seq_nb++;
                 flag_twr=0;
             }
             else
             {
                dwt_rxreset();
             }

         }
       }
     }
     else
     {
       /* Clear RX error events in the DW1000 status register. */
       lp:dwt_write32bitreg(SYS_STATUS_ID, SYS_STATUS_RXFCG|SYS_STATUS_ALL_RX_TO | SYS_STATUS_ALL_RX_ERR);
     }
  }
}
static uint32_t nrf5_flash_end_addr_get()
{
    uint32_t const bootloader_addr = NRF_UICR->NRFFW[0];
    uint32_t const page_sz         = NRF_FICR->CODEPAGESIZE;
    uint32_t const code_sz         = NRF_FICR->CODESIZE;

    return (bootloader_addr != 0xFFFFFFFF ?
            bootloader_addr : (code_sz * page_sz));
}
static void fstorage_evt_handler(nrf_fstorage_evt_t * p_evt)
{
    if (p_evt->result != NRF_SUCCESS)
    {
        NRF_LOG_INFO("--> Event received: ERROR while executing an fstorage operation.");
        return;
    }
}
void wait_for_flash_ready(nrf_fstorage_t const * p_fstorage)
{
    /* While fstorage is busy, sleep and wait for an event. */
    while (nrf_fstorage_is_busy(p_fstorage))
    {};
}
static uint32_t round_up_u32(uint32_t len)
{
    if (len % sizeof(uint32_t))
    {
        return (len + sizeof(uint32_t) - (len % sizeof(uint32_t)));
    }

    return len;
}

static void fstorage_erase(uint32_t addr, uint32_t pages_cnt)
{
    ret_code_t rc = nrf_fstorage_erase(&fstorage, addr, pages_cnt, NULL);
}
static void fstorage_write(uint32_t addr, void const * p_data)
{
    uint32_t len = round_up_u32(strlen(p_data));
    fstorage_erase(addr,1);
    ret_code_t rct = nrf_fstorage_write(&fstorage, addr, p_data, len, NULL);
    wait_for_flash_ready(&fstorage);
}