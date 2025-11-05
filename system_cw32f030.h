/*!****************************************************************************
 * @file
 * system_cw32f030.h
 *
 * @brief
 * Early system initialisation
 *
 * @date  03.11.2025
 ******************************************************************************/

#ifndef SYSTEM_CW32F030_H_
#define SYSTEM_CW32F030_H_

/*- Header files -------------------------------------------------------------*/
#include <stdint.h>


/*- Macros -------------------------------------------------------------------*/
#ifndef VECT_TAB_OFFSET
/// Interrupt Vector Table address offset, adjustable for relocation
#define VECT_TAB_OFFSET               0uL
#endif // VECT_TAB_OFFSET


/*- Global variables ---------------------------------------------------------*/
/// Calculated SYSCLK frequency in Hz
extern volatile uint32_t SystemCoreClock;


/*- Public interface ---------------------------------------------------------*/
void SystemInit(void);

#endif /* SYSTEM_CW32F030_H_ */
