# mculib-controller-cw32f030

MCU system library for WHXY CW32F030 series MCU

## Setup Notes

* Clone into `<project root>\Controller\CW32F030\` with `--recursive` tag
* Template files
  * Exclude `Template` folder from builds
  * Copy template files into parent `Controller` folder and modify to suit system needs
* Target Processor settings
  * Architecture: Armv6-M (`-march=armv6-m`)
  * CPU: Cortex-M0+ (`-mcpu=cortex-m0plus`)
  * Thumb mode (`-mthumb`)
* Linker settings
  * Add this `CW32F030` folder to the linker search path (it needs to be able to find `linker_script_common.ld`).
  * Linker scripts for each type are provided:
    * `linker_script_cw32f030x6.ld` (32 kB FLASH, 6 kB SRAM)
    * `linker_script_cw32f030x8.ld` (64 kB FLASH, 8 kB SRAM)

## JLink flashloader

In order to use JLink debug probes with this MCU, you need to add the `JLinkDevices.xml` and flashloader to your `~/.config/SEGGER/` path. The `Tools` folder contains a convenience script `install_jlink` to do this for you:

    Tools/install_jlink.sh

## Debug support (SVD)

The SVD file for this MCU is included in the `Tools` folder:

    Tools/CW32F030.svd