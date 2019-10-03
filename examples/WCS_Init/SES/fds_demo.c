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
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"
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
#include "fds.h"
#include "nrf_fstorage.h"
#include "nrf_fstorage_nvmc.h"
typedef enum
{
    DATA_FMT_HEX = 'h',
    DATA_FMT_STR = 's'
} data_fmt_t;
static void fstorage_evt_handler(nrf_fstorage_evt_t * p_evt);
NRF_FSTORAGE_DEF(nrf_fstorage_t fstorage) =
{
    /* Set a handler for fstorage events. */
    .evt_handler = fstorage_evt_handler,
    .start_addr = 0x3e000,
    .end_addr   = 0x3ffff,
};
/* Dummy data to write to flash. */
static unsigned char m_data[3]          = {100,8,9};
static char     m_hello_world[] = "hello world";
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

    switch (p_evt->id)
    {
        case NRF_FSTORAGE_EVT_WRITE_RESULT:
        {
            NRF_LOG_INFO("--> Event received: wrote %d bytes at address 0x%x.",
                         p_evt->len, p_evt->addr);
        } break;

        case NRF_FSTORAGE_EVT_ERASE_RESULT:
        {
            NRF_LOG_INFO("--> Event received: erased %d page from address 0x%x.",
                         p_evt->len, p_evt->addr);
        } break;

        default:
            break;
    }
}

static void print_flash_info(nrf_fstorage_t * p_fstorage)
{
    NRF_LOG_INFO("========| flash info |========");
    NRF_LOG_INFO("erase unit: \t%d bytes",      p_fstorage->p_flash_info->erase_unit);
    NRF_LOG_INFO("program unit: \t%d bytes",    p_fstorage->p_flash_info->program_unit);
    NRF_LOG_INFO("==============================");
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
    if (rc != NRF_SUCCESS)
    {
       NRF_LOG_INFO("error erase\n\r");
    }
}
static void fstorage_write(uint32_t addr, void const * p_data)
{
    uint32_t len = round_up_u32(strlen(p_data));
    fstorage_erase(addr,1);
    ret_code_t rct = nrf_fstorage_write(&fstorage, addr, p_data, len, NULL);
    wait_for_flash_ready(&fstorage);
    if (rct != NRF_SUCCESS)
    {
        NRF_LOG_INFO("error write\n\r");
    }
}
void main()
{
  NRF_LOG_INIT(NULL);
  NRF_LOG_DEFAULT_BACKENDS_INIT();
  nrf_fstorage_api_t * p_fs_api;
  p_fs_api = &nrf_fstorage_nvmc;
  nrf_fstorage_init(&fstorage, p_fs_api, NULL);
  print_flash_info(&fstorage);
  nrf5_flash_end_addr_get();
//  NRF_LOG_INFO("Writing \"%x\" to flash.", m_data);
//  fstorage_write(0x3e000, &m_data);
//  wait_for_flash_ready(&fstorage);
//  NRF_LOG_INFO("Done\n\r");
 // NRF_LOG_INFO("Writing \"%x\" to flash.",m_data);
 //
 // nrf_fstorage_write(&fstorage, 0x3e000, m_data, sizeof(m_data), NULL);
  //fstorage_write(0x3e000, &m_data);
 // wait_for_flash_ready(&fstorage);
  //NRF_LOG_INFO("Done\n\r");
  NRF_LOG_INFO("Read data at 0x%x\n\r",0x3e000);
  //unsigned char *p=fstorage_read(0x3e000,sizeof(m_data),DATA_FMT_HEX);
  unsigned char a[3];
  nrf_fstorage_read(&fstorage, 0x3e000, a, 3);
  NRF_LOG_INFO(" mang a: %d\n\r",a[2]);
 //
}

