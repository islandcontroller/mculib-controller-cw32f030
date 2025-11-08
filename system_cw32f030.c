/*!****************************************************************************
 * @file
 * system_cw32f030.c
 *
 * @brief
 * Early system initialisation
 *
 * @date  03.11.2025
 ******************************************************************************/

/*- Header files -------------------------------------------------------------*/
#include "cw32f030_rcc.h"
#include "system_cw32f030.h"


/*- Compiler options ---------------------------------------------------------*/
#pragma GCC push_options
#pragma GCC optimize("O1")


/*- Global variables ---------------------------------------------------------*/
/// Calculated SYSCLK frequency in Hz
volatile uint32_t SystemCoreClock;


/*- Public interface ---------------------------------------------------------*/
/*!****************************************************************************
 * @brief
 * Early system init
 * 
 * Configures relocateable interrupt vector table and initialises minimum-
 * config for clock tree.
 * 
 * @date  03.11.2025
 ******************************************************************************/
void SystemInit(void)
{
#if __VTOR_PRESENT
  // Configure IVT relocation
  SCB->VTOR = VECT_TAB_OFFSET & ~0xFFuL;
#endif // __VTOR_PRESENT

  // Load HSI calibration value and configure HSI divider
  // for 8 MHz output
  uint32_t ulTrim = (uint32_t)*((volatile const uint16_t*)0x12600uL) & SYSCTRL_HSI_TRIM_Msk;
  CW_SYSCTRL->HSI = (0x5uL << SYSCTRL_HSI_DIV_Pos)     | // DIV = 6 (default)
                    (ulTrim << SYSCTRL_HSI_TRIM_Pos);    // Factory trim

  // Enable HSI
  CW_SYSCTRL->CR1 = (0x5A5AuL << SYSCTRL_CR1_KEY_Pos)  | // Unlock
                    (1uL << SYSCTRL_CR1_HSIEN_Pos);      // HSI Enable

  // Configure FLASH wait states, prefetch and cache
  __RCC_FLASH_CLK_ENABLE();
  CW_FLASH->CR2   = (0x5A5AuL << FLASH_CR2_KEY_Pos)    | // Unlock
                    (0uL << FLASH_CR2_CACHE_Pos)       | // Disable cache
                    (0uL << FLASH_CR2_FETCH_Pos)       | // Disable prefetch
                    (0uL << FLASH_CR2_WAIT_Pos);         // 1 wait state

  // Wait for HSI to stabilise
  while ((CW_SYSCTRL->HSI & SYSCTRL_HSI_STABLE_Msk) == 0uL);

  // Set SYSCLK to HSI and configure dividers
  CW_SYSCTRL->CR0 = (0x5A5AuL << SYSCTRL_CR0_KEY_Pos)  | // Unlock
                    (0uL << SYSCTRL_CR0_SYSCLK_Pos)    | // SYSCLK from HSI
                    (0uL << SYSCTRL_CR0_HCLKPRS_Pos)   | // HCLK = SYSCLK
                    (0uL << SYSCTRL_CR0_PCLKPRS_Pos);    // PCLK = HCLK

  // Reset to default core clock frequency
  SystemCoreClock = HSI_VALUE / 6uL;
}


/*- Restore compiler options -------------------------------------------------*/
#pragma GCC pop_options
