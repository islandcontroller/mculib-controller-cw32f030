/*!****************************************************************************
 * @file
 * linker_script_cw32f030x6.ld
 *
 * @brief
 * Device specific linker script for CW32F030x6 application code
 *
 * @date  03.11.2025
 ******************************************************************************/

/* Stack and heap memory size definitions                                     */
__min_heap_size = 0;                /* Minimum required heap size             */
__stack_size = 512;                 /* Reserved stack size                    */ 

/* Memories definition                                                        */
MEMORY
{
  FLASH     (rx)  : ORIGIN = 0x00000000, LENGTH = 32K
  RAM       (xrw) : ORIGIN = 0x20000000, LENGTH = 6K
}

/* Include common definitions                                                 */
INCLUDE linker_script_common.ld