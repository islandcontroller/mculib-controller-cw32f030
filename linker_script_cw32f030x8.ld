/*!****************************************************************************
 * @file
 * linker_script_cw32f030x8.ld
 *
 * @brief
 * Device specific linker script for CW32F030x8 application code
 *
 * @date  03.11.2025
 ******************************************************************************/

/* Stack and heap memory size definitions                                     */
__min_heap_size = 0;                /* Minimum required heap size             */
__stack_size = 512;                 /* Reserved stack size                    */ 

/* Memories definition                                                        */
MEMORY
{
  FLASH     (rx)  : ORIGIN = 0x00000000, LENGTH = 64K
  RAM       (xrw) : ORIGIN = 0x20000000, LENGTH = 8K
}

/* Include common definitions                                                 */
INCLUDE linker_script_common.ld