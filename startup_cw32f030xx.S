.include "Core/startup_cm0plus.s"

.syntax unified
.cpu cortex-m0plus
.fpu softvfp
.thumb

/******************************************************************************
 * _vector_base
 * Interrupt Vector Table
 ******************************************************************************/
.section  .isr_vector, "a", %progbits
.balign 4
.globl  _vector_base
_vector_base:
  /* Main stack pointer                                                       */
  .word _estack
  /* Internal interrupts                                                      */
  .word _start
  .word NMI_Handler
  .word HardFault_Handler
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word 0
  .word SVC_Handler
  .word 0
  .word 0
  .word PendSV_Handler
  .word SysTick_Handler
  /* External Interrupts                                                      */
  .word WDT_IRQHandler
  .word LVD_IRQHandler
  .word RTC_IRQHandler
  .word FLASHRAM_IRQHandler
  .word RCC_IRQHandler
  .word GPIOA_IRQHandler
  .word GPIOB_IRQHandler
  .word GPIOC_IRQHandler
  .word GPIOF_IRQHandler
  .word DMACH1_IRQHandler
  .word DMACH23_IRQHandler
  .word DMACH45_IRQHandler
  .word ADC_IRQHandler
  .word ATIM_IRQHandler
  .word VC1_IRQHandler
  .word VC2_IRQHandler
  .word GTIM1_IRQHandler
  .word GTIM2_IRQHandler
  .word GTIM3_IRQHandler
  .word GTIM4_IRQHandler
  .word BTIM1_IRQHandler
  .word BTIM2_IRQHandler
  .word BTIM3_IRQHandler
  .word I2C1_IRQHandler
  .word I2C2_IRQHandler
  .word SPI1_IRQHandler
  .word SPI2_IRQHandler
  .word UART1_IRQHandler
  .word UART2_IRQHandler
  .word UART3_IRQHandler
  .word AWT_IRQHandler
  .word FAULT_IRQHandler

/* Weak definitions of interrupt handlers in .text                            */
.section  .text.vector_handler, "ax", %progbits
.weak NMI_Handler
.weak HardFault_Handler
.weak SVC_Handler
.weak PendSV_Handler
.weak SysTick_Handler
.weak WDT_IRQHandler
.weak LVD_IRQHandler
.weak RTC_IRQHandler
.weak FLASHRAM_IRQHandler
.weak RCC_IRQHandler
.weak GPIOA_IRQHandler
.weak GPIOB_IRQHandler
.weak GPIOC_IRQHandler
.weak GPIOF_IRQHandler
.weak DMACH1_IRQHandler
.weak DMACH23_IRQHandler
.weak DMACH45_IRQHandler
.weak ADC_IRQHandler
.weak ATIM_IRQHandler
.weak VC1_IRQHandler
.weak VC2_IRQHandler
.weak GTIM1_IRQHandler
.weak GTIM2_IRQHandler
.weak GTIM3_IRQHandler
.weak GTIM4_IRQHandler
.weak BTIM1_IRQHandler
.weak BTIM2_IRQHandler
.weak BTIM3_IRQHandler
.weak I2C1_IRQHandler
.weak I2C2_IRQHandler
.weak SPI1_IRQHandler
.weak SPI2_IRQHandler
.weak UART1_IRQHandler
.weak UART2_IRQHandler
.weak UART3_IRQHandler
.weak AWT_IRQHandler
.weak FAULT_IRQHandler

/* Default to generic handler if not implemented                              */
.thumb_set NMI_Handler, Default_Handler
.thumb_set HardFault_Handler, Default_Handler
.thumb_set SVC_Handler, Default_Handler
.thumb_set PendSV_Handler, Default_Handler
.thumb_set SysTick_Handler, Default_Handler
.thumb_set WDT_IRQHandler, Default_Handler
.thumb_set LVD_IRQHandler, Default_Handler
.thumb_set RTC_IRQHandler, Default_Handler
.thumb_set FLASHRAM_IRQHandler, Default_Handler
.thumb_set RCC_IRQHandler, Default_Handler
.thumb_set GPIOA_IRQHandler, Default_Handler
.thumb_set GPIOB_IRQHandler, Default_Handler
.thumb_set GPIOC_IRQHandler, Default_Handler
.thumb_set GPIOF_IRQHandler, Default_Handler
.thumb_set DMACH1_IRQHandler, Default_Handler
.thumb_set DMACH23_IRQHandler, Default_Handler
.thumb_set DMACH45_IRQHandler, Default_Handler
.thumb_set ADC_IRQHandler, Default_Handler
.thumb_set ATIM_IRQHandler, Default_Handler
.thumb_set VC1_IRQHandler, Default_Handler
.thumb_set VC2_IRQHandler, Default_Handler
.thumb_set GTIM1_IRQHandler, Default_Handler
.thumb_set GTIM2_IRQHandler, Default_Handler
.thumb_set GTIM3_IRQHandler, Default_Handler
.thumb_set GTIM4_IRQHandler, Default_Handler
.thumb_set BTIM1_IRQHandler, Default_Handler
.thumb_set BTIM2_IRQHandler, Default_Handler
.thumb_set BTIM3_IRQHandler, Default_Handler
.thumb_set I2C1_IRQHandler, Default_Handler
.thumb_set I2C2_IRQHandler, Default_Handler
.thumb_set SPI1_IRQHandler, Default_Handler
.thumb_set SPI2_IRQHandler, Default_Handler
.thumb_set UART1_IRQHandler, Default_Handler
.thumb_set UART2_IRQHandler, Default_Handler
.thumb_set UART3_IRQHandler, Default_Handler
.thumb_set AWT_IRQHandler, Default_Handler
.thumb_set FAULT_IRQHandler, Default_Handler


/******************************************************************************
 * Default_Handler
 * Default interrupt handler for unimplemented interrupts
 ******************************************************************************/
.section  .text.Default_Handler
.balign 4
.globl  Default_Handler
.type   Default_Handler, %function
Default_Handler:
  b     Default_Handler
