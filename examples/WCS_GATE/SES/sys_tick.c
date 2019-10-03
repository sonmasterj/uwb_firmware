#include <stdbool.h>
 #include <stdint.h>
 #include "nrf_delay.h"
 #include "nrf_gpio.h"
 #include "boards.h"                              
  
 #define SYSTICK_COUNT_ENABLE        1
 #define SYSTICK_INTERRUPT_ENABLE    2
 uint32_t returnCode; 
 uint32_t msTicks = 0; /* Variable to store millisecond ticks */
 /* SysTick interrupt Handler. */
 void SysTick_Handler(void)  {
     if(++msTicks == 500) {
         nrf_gpio_pin_toggle(30); /* light LED 2 very 1 second */
         msTicks = 0;
     }
 }
 
 /**
21  * @brief Function for application main entry.
22  */
 int main(void)
 {
    // Configure LED 2 as outputs.
     //LEDS_CONFIGURE(30);
     nrf_gpio_cfg_output(30);

     returnCode = SysTick_Config(SystemCoreClock / 1000);      /* Configure SysTick to generate an interrupt every millisecond */ 
     if (returnCode != 0)  {                                   /* Check return code for errors */
     // Error Handling 
     }
    // NVIC_EnableIRQ(SysTick_IRQn);
     // The following code has the same effect
     //    SysTick->VAL   = 640000UL;                                //Start value for the sys Tick counter
    //    SysTick->LOAD  = 640000UL;                                //Reload value 
    //    SysTick->CTRL = SYSTICK_INTERRUPT_ENABLE
     //                    |SYSTICK_COUNT_ENABLE;                    //Start and enable interrupt
     while(1);
 }