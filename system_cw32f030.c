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

  // Load HSI calibration value and enable it
  uint32_t ulHsiTrim = (uint32_t)*((volatile const uint16_t*)RCC_HSI_TRIMCODEADDR);
  CW_SYSCTRL->HSI = RCC_HSIOSC_DIV6 | (ulHsiTrim & 0x3FFuL);
  CW_SYSCTRL->CR1 = (CW_SYSCTRL->CR1 & ~SYSCTRL_BYPASS_MASK) | SYSCTRL_BYPASS | RCC_SYSCTRL_HSIEN;

  // Switch SYSCLK to HSI/1
  CW_SYSCTRL->CR0 = SYSCTRL_BYPASS | RCC_SYSCLKSRC_HSI | RCC_HCLK_DIV1;

  // Disable MCO and other oscillators
  CW_SYSCTRL->CR1 = SYSCTRL_BYPASS | SYSCTRL_CR1_HSIEN_Msk;
  CW_SYSCTRL->MCO = RCC_MCO_SRC_NONE;

  // Reset to default core clock frequency
  SystemCoreClock = HSI_VALUE / 6uL;
}


/*- Restore compiler options -------------------------------------------------*/
#pragma GCC pop_options
