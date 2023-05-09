/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Configuration for MediaTek MT7622/MT7986 SoC
 *
 */

#ifndef __MT7XXX_H
#define __MT7XXX_H

/* Uboot definition */
#define CFG_SYS_UBOOT_BASE		CONFIG_TEXT_BASE

/* SPL -> Uboot */
#define CFG_SYS_UBOOT_START		CONFIG_TEXT_BASE

/* DRAM */
#define CFG_SYS_SDRAM_BASE		0x40000000

/* This is needed for kernel booting */
#define FDT_HIGH			"0x4fd00000"

#define ENV_MEM_LAYOUT_SETTINGS				\
	"fdt_high=" FDT_HIGH "\0"			\
	"kernel_addr_r=0x44000000\0"			\
	"ramdisk_addr_r=0x48000000\0"			\
	"scriptaddr=0x4fc00000\0"			\
	"fdt_addr_r=" FDT_HIGH "\0"			\
	"fdtfile=" CONFIG_DEFAULT_FDT_FILE "\0"

#ifdef CONFIG_DISTRO_DEFAULTS

#define BOOT_TARGET_DEVICES(func)	\
	func(MMC, mmc, 1)	\
	func(MMC, mmc, 0)

#include <config_distro_bootcmd.h>

/* Extra environment variables */
#define CFG_EXTRA_ENV_SETTINGS	\
	ENV_MEM_LAYOUT_SETTINGS		\
	BOOTENV

#endif /* ifdef CONFIG_DISTRO_DEFAULTS*/

#endif
