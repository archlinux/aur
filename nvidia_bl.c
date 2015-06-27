/*
 * Display backlight driver for Nvidia graphics adapters.
 *
 * Copyright (c) 2008-2010 Mario Schwalbe <schwalbe@inf.tu-dresden.de>
 * Based on the mechanism dicovered by the author of NvClock:
 *     Copyright (c) 2001-2009 Roderick Colenbrander
 *     Site: http://nvclock.sourceforge.net
 * Fixes and suggestions by:
 *     Guillaume Zin <guillaume.zin@gmail.com>
 *     Steven Barrett <damentz@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 */

#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/platform_device.h>
#include <linux/backlight.h>
#include <linux/dmi.h>
#include <linux/pci.h>
#include <linux/err.h>
#include <linux/version.h>

/*
 * Maybe the check against the subsystem vendor should be removed,
 * but there's no guarantee that the chip's smartdimmer signals
 * are actually connected to the display logic. Right now, these
 * are the supported (read connected) vendors according to NvClock.
 *
 * TODO: Remove this stuff. Shouldn't be necessary.
 */
/* #define CONFIG_NVIDIA_BL_CHECK_SUBSYSTEM_VENDOR */

/* Check whether backlight props.state is present */
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,31)
	#define HAVE_BACKLIGHT_PROPS_STATE
#endif

/* Check whether we have to initialize backlight props */
#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,34)
	#define INIT_BACKLIGHT_PROPS
#endif

/* Register constants */
#define NV4X_BRIGHTNESS_OFFSET				0x15f2
#define NV4X_BRIGHTNESS_MASK				0x001f
#define NV5X_PDISPLAY_OFFSET				0x00610000
#define NV5X_PDISPLAY_BRIGHTNESS_OFFSET			0x0000c084
#define NV5X_PDIPSLAY_BRIGHTNESS_CONTROL_ENABLED	0x80000000

/*
 * Driver private data structure
 */
struct driver_data {
	/* PCI region (BAR) the smartdimmer register is in */
	unsigned bar;
	/* Register offset into this region */
	unsigned long reg_offset;
	/* Register size in byte */
	unsigned reg_size;
	/* Register mask to apply while updating the register (NV5X only) */
	unsigned reg_mask;
	/* Maximum brightness level in the range 0 ... max_level */
	unsigned max_level;

	/* Hardware register get/set functions */
	struct driver_data_ops {
		unsigned (*get_intensity)(const struct driver_data *dd);
		int (*set_intensity)(struct driver_data *dd,
		                     unsigned intensity);
	} ops;

	/* The device we drive */
	struct pci_dev *dev;
	/* Pointer to the mapped smartdimmer register */
	/* volatile */ void __iomem *smartdimmer;
};

/*
 * Machine quirks
 */
struct machine_quirks {
	/* Request to drive a specific device for machines
	 * incorporating several graphics adapters */
	unsigned dev_id;
	/* Some machines seem to ignore higher levels
	 * although supported by the graphics adapter. */
	unsigned max_level;
};

/*
 * Module parameters
 */
static unsigned debug = 0;
module_param_named(debug, debug, int, 0644);
MODULE_PARM_DESC(debug, "Set to one to enable debugging messages.");

static unsigned shift = 0;
module_param_named(shift, shift, int, 0444);
MODULE_PARM_DESC(shift, "Shift the value by n bits to reduce the range.");

static unsigned dev_id = PCI_ANY_ID;
module_param_named(dev_id, dev_id, int, 0444);
MODULE_PARM_DESC(dev_id, "Disable auto-detection and attempt to drive exactly "
	"the device of this PCI ID if present.");

static unsigned max_level = 0;
module_param_named(max_level, max_level, int, 0444);
MODULE_PARM_DESC(max_level, "Maximum brightness level to use in the range "
	"0 ... max_level. Use with care.");

static unsigned force = 0;
module_param_named(force, force, int, 0444);
MODULE_PARM_DESC(force, "Force loading of the driver even if the device "
	"is an unknown Nvidia graphics adapter. Use with care.");

/*
 * Implementation for NV4X chips
 * (NV40, NV41, NV43, NV44, NV46, NV47, NV49, NV4B, C51)
 */
static unsigned nv4x_get_intensity(const struct driver_data *dd)
{
	const unsigned value = ioread16(dd->smartdimmer);

	if (unlikely(debug))
		printk(KERN_DEBUG "nvidia_bl: register read: 0x%04x\n", value);

	return value & NV4X_BRIGHTNESS_MASK;
}

static int nv4x_set_intensity(struct driver_data *dd, unsigned intensity)
{
	const unsigned value =
		(ioread16(dd->smartdimmer) & ~NV4X_BRIGHTNESS_MASK) |
		intensity;

	if (unlikely(debug))
		printk(KERN_DEBUG "nvidia_bl: register write: 0x%04x\n", value);

	iowrite16(value, dd->smartdimmer);
	return 0;
}

static const struct driver_data nv4x_driver_data __devinitconst = {
	.bar        = 0,
	.reg_offset = NV4X_BRIGHTNESS_OFFSET,
	.reg_size   = 2,
	.max_level  = 31,
	.ops        = {
		.get_intensity = &nv4x_get_intensity,
		.set_intensity = &nv4x_set_intensity,
	}
};

/*
 * Implementation for NV5X chips
 * (NV50, G84, G86, G92, G94, G96, GT200)
 */
static unsigned nv5x_get_intensity(const struct driver_data *dd)
{
	unsigned value = ioread32(dd->smartdimmer);

	if (unlikely(debug))
		printk(KERN_DEBUG "nvidia_bl: register read: 0x%08x\n", value);

	value &= dd->reg_mask;
	return (value <= dd->max_level) ? value : dd->max_level;
}

static int nv5x_set_intensity(struct driver_data *dd, unsigned intensity)
{
	const unsigned value = (intensity & dd->reg_mask)
		| NV5X_PDIPSLAY_BRIGHTNESS_CONTROL_ENABLED;

	if (unlikely(debug))
		printk(KERN_DEBUG "nvidia_bl: register write: 0x%08x\n", value);

	iowrite32(value, dd->smartdimmer);
	return 0;
}

static const struct driver_data nv5x_driver_data __devinitconst = {
	.bar        = 0,
	.reg_offset = NV5X_PDISPLAY_OFFSET + NV5X_PDISPLAY_BRIGHTNESS_OFFSET,
	.reg_size   = 4,
	/* Could set up to 11 bits. More got ignored. */
	.max_level  = 2047,
	.ops        = {
		.get_intensity = &nv5x_get_intensity,
		.set_intensity = &nv5x_set_intensity,
	}
};

/*
 * Device matching.
 *
 * The list of supported devices was primarily taken from Nvidia's driver
 * documentation appendix A, available at:
 * http://download.nvidia.com/XFree86/Linux-x86_64/<version>/README/supportedchips.html
 * and completed with NvClock's device table and posts by users of Nvidia's forum at:
 * http://www.nvnews.net/vbulletin/showthread.php?t=143025.
 *
 * Please send reports to Mario Schwalbe <schwalbe@inf.tu-dresden.de>
 * and also include the output of:
 * $ cat /sys/class/dmi/id/sys_vendor
 * $ cat /sys/class/dmi/id/product_name
 */
static DEFINE_PCI_DEVICE_TABLE(nvidia_bl_device_table) = {
	/* Geforce Go 7800 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0098), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7800 GTX (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0099), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6800 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x00c8), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6800 Ultra (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x00c9), (kernel_ulong_t)&nv4x_driver_data },
	/* Quadro FX Go 1400 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x00cc), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6600 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0144), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6600 TE/6200 TE (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0146), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6600 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0148), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6600 GT (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0149), (kernel_ulong_t)&nv4x_driver_data },
	/* Quadro FX 540M (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x014c), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6200 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0164), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6400 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0166), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6200 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0167), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6400 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0168), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7200 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x01d6), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7300 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x01d7), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7400 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x01d8), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7400GS (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x01d9), (kernel_ulong_t)&nv4x_driver_data },
	/* Quadro NVS 110M (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x01da), (kernel_ulong_t)&nv4x_driver_data },
	/* Quadro NVS 120M (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x01db), (kernel_ulong_t)&nv4x_driver_data },
	/* Quadro FX 350M (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x01dc), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce 7500 LE (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x01dd), (kernel_ulong_t)&nv4x_driver_data },
	/* NV44M (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x0228), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6150 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0244), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 6100 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0247), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7950 GTX (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0297), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7900 GS (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0298), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7900GTX (NvClock) / Quadro NVS 510M (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0299), (kernel_ulong_t)&nv4x_driver_data },
	/* Quadro FX 2500M (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x029a), (kernel_ulong_t)&nv4x_driver_data },
	/* Quadro FX 1500M (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x029b), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7700 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0397), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7600 (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0398), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7600 GT (195.30) */
	{ PCI_VDEVICE(NVIDIA, 0x0399), (kernel_ulong_t)&nv4x_driver_data },
	/* Quadro NVS 300M (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x039a), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce Go 7900SE (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x039b), (kernel_ulong_t)&nv4x_driver_data },
	/* QuadroFX 550M (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x039c), (kernel_ulong_t)&nv4x_driver_data },
	/* Geforce 9500M GS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0405), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce NB9P-GE (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x0406), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8600M GT (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0407), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9650M GS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0408), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8700M GT (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0409), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro NVS 370M (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x040a), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro NVS 320M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x040b), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 570M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x040c), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 1600M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x040d), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8600M GS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0425), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8400M GT (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0426), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8400M GS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0427), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8400M G (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0428), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro NVS 140M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0429), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro NVS 130M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x042a), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro NVS 135M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x042b), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro NVS 135M (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x042c), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 360M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x042d), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9300M G (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x042e), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 7150M / nForce 630M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0531), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 7000M / nForce 610M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0533), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9800M GTX (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0608), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8800M GTS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0609), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTX 280M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x060a), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9800M GT (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x060b), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8800M GTX (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x060c), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTX 285M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x060f), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9800M GTX (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0617), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTX 260M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0618), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 3600M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x061c), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 2800M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x061d), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 3700M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x061e), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 3800M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x061f), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9800M GTS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0628), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9700M GTS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x062a), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9800M GS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x062b), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9800M GTS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x062c), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTS 160M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0631), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTS 150M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0632), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 2700M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x063a), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9600M GT (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0647), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9600M GS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0648), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9600M GT (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0649), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9700M GT (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x064a), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9500M G (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x064b), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9650M GT (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x064c), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce G 110M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0651), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 130M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0652), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 120M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0653), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 220M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0654), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9650S (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x0656), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 380 (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x0658), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 580 (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x0659), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 1700M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x065a), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9400GT (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x065b), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 770M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x065c), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTX 480M (256.53) */
	{ PCI_VDEVICE(NVIDIA, 0x06ca), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9300M GS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x06e5), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9200M GS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x06e8), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9300M GS (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x06e9), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro NVS 150M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x06ea), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro NVS 160M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x06eb), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce G 105M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x06ec), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce G 103M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x06ef), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce G 105M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x06f1), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 370M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x06fb), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9100M G (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0844), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8200M G (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0845), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9400M G (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0862), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9400M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0863), (kernel_ulong_t)&nv5x_driver_data },
	/* ION (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0865), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9400M G (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0866), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9100M G (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x086e), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 8200M G (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x086f), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9400M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0870), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 9200 (NvClock) */
	{ PCI_VDEVICE(NVIDIA, 0x0871), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce G 102M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0872), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce G 102M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0873), (kernel_ulong_t)&nv5x_driver_data },
	/* ION (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0874), (kernel_ulong_t)&nv5x_driver_data },
	/* ION (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0876), (kernel_ulong_t)&nv5x_driver_data },
	/* ION (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x087d), (kernel_ulong_t)&nv5x_driver_data },
	/* ION LE (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x087e), (kernel_ulong_t)&nv5x_driver_data },
	/* ION LE (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x087f), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 320M (User report) */
	{ PCI_VDEVICE(NVIDIA, 0x08a0), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 320M (User report) */
	{ PCI_VDEVICE(NVIDIA, 0x08a2), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 320M (User report) */
	{ PCI_VDEVICE(NVIDIA, 0x08a3), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 230M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a28), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 330M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a29), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 230M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a2a), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 330M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a2b), (kernel_ulong_t)&nv5x_driver_data },
	/* NVS 5100M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a2c), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 320M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a2d), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 240M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a34), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 325M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a35), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 880M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a3c), (kernel_ulong_t)&nv5x_driver_data },
	/* ION (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a64), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce G 105M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a68), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce G 105M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a69), (kernel_ulong_t)&nv5x_driver_data },
	/* NVS 2100M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a6a), (kernel_ulong_t)&nv5x_driver_data },
	/* NVS 3100M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a6c), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 305M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a6e), (kernel_ulong_t)&nv5x_driver_data },
	/* ION (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a6f), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 310M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a70), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 305M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a71), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 310M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a72), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 305M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a73), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce G 210M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a74), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce 310M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a75), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 380M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0a7c), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTS 260M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0ca8), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTS 250M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0ca9), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GT 335M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0caf), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTS 350M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0cb0), (kernel_ulong_t)&nv5x_driver_data },
	/* Geforce GTS 360M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0cb1), (kernel_ulong_t)&nv5x_driver_data },
	/* Quadro FX 1800M (195.36) */
	{ PCI_VDEVICE(NVIDIA, 0x0cbc), (kernel_ulong_t)&nv5x_driver_data },

	/* end of list */
	{ }
};

#ifdef CONFIG_NVIDIA_BL_CHECK_SUBSYSTEM_VENDOR

/*
 * Supported subsystem vendors.
 * Defined separately to not unnecessarily enlarge the previous array.
 */
static const unsigned nvidia_bl_subvendors[] __initdata = {
	PCI_VENDOR_ID_APPLE,
	PCI_VENDOR_ID_HP,
	PCI_VENDOR_ID_SAMSUNG,
	PCI_VENDOR_ID_SONY,
	PCI_VENDOR_ID_TOSHIBA,
	PCI_VENDOR_ID_DELL,
	0x1a46, /* PCI_VENDOR_ID_ZEPTO not defined */
};

#endif

/*
 * Machine specific quirks used below.
 */
static const struct machine_quirks apple_quirks __initdata = {
	.dev_id		= PCI_ANY_ID,
	.max_level	= 1023
};

static const struct machine_quirks apple_quirks_320m __initdata = {
	.dev_id		= PCI_ANY_ID,
	.max_level	= 44000
};

static const struct machine_quirks max_level_0x1ffff __initdata = {
	.dev_id		= PCI_ANY_ID,
	.max_level	= 0x1ffff
};

/*
 * DMI matching.
 */
static const struct dmi_system_id *nvidia_bl_dmi_system_id;

static int nvidia_bl_dmi_match(const struct dmi_system_id *id)
{
	printk(KERN_INFO "nvidia_bl: %s detected\n", id->ident);
	nvidia_bl_dmi_system_id = id;
	return 1;
}

static const struct dmi_system_id nvidia_bl_machine_table[] __initdata = {
	/*
	 * Apple machines: Intel chipset, Nvidia graphics
	 */
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookPro 3,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro3,1"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookPro 3,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro3,2"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookPro 4,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro4,1"),
		},
		.driver_data	= (void *)&apple_quirks,
	},

	/*
	 * Apple machines: Nvidia chipset, Nvidia graphics
	 */
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBook 5,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5,1"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBook 5,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook5,2"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookAir 2,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookAir2,1"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookPro 5,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,1"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookPro 5,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,2"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookPro 5,3",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,3"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookPro 5,4",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,4"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookPro 5,5",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro5,5"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBook 6,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook6,1"),
		},
		.driver_data	= (void *)&apple_quirks,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBook 7,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBook7,1"),
		},
		.driver_data	= (void *)&apple_quirks_320m,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookPro 7,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookPro7,1"),
		},
		.driver_data	= (void *)&apple_quirks_320m,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookAir 3,1",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookAir3,1"),
		},
		.driver_data	= (void *)&apple_quirks_320m,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "MacBookAir 3,2",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Apple Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "MacBookAir3,2"),
		},
		.driver_data	= (void *)&apple_quirks_320m,
	},

	/*
	 * Sony machines: Nvidia graphics
	 */
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "Sony VGN-AW11",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-AW11"),
		},
		.driver_data	= NULL, /* defaults */
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "Sony VGN-FZ38M",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-FZ38M"),
		},
		.driver_data	= NULL, /* defaults */
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "Sony VGN-FZ11E",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
			DMI_MATCH(DMI_PRODUCT_NAME, "VGN-FZ11E"),
		},
		.driver_data	= NULL, /* defaults */
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "Sony VPCCW27FX",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
			DMI_MATCH(DMI_PRODUCT_NAME, "VPCCW27FX"),
		},
		.driver_data	= (void *)&max_level_0x1ffff,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "Sony VPCCW21FX",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
			DMI_MATCH(DMI_PRODUCT_NAME, "VPCCW21FX"),
		},
		.driver_data	= (void *)&max_level_0x1ffff,
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "Sony VPCCW2S1E",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Sony Corporation"),
			DMI_MATCH(DMI_PRODUCT_NAME, "VPCCW2S1E"),
		},
		.driver_data	= (void *)&max_level_0x1ffff,
	},

	/*
	 * Dell machines: Nvidia graphics
	 */
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "Dell Inspiron 1370",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 1370"),
		},
		.driver_data	= NULL, /* defaults */
	},
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "Dell Vostro 3500",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 3500"),
		},
		.driver_data	= (void *)&max_level_0x1ffff,
	},

	/*
	 * Toshiba machines: Nvidia graphics
	 */
	{
		.callback	= &nvidia_bl_dmi_match,
		.ident		= "Toshiba Satellite Pro U500",
		.matches	= {
			DMI_MATCH(DMI_SYS_VENDOR, "TOSHIBA"),
			DMI_MATCH(DMI_PRODUCT_NAME, "SATELLITE PRO U500"),
		},
		.driver_data	= (void *)&max_level_0x1ffff,
	},

	/* end of list */
	{ }
};

/*
 * Driver data implementation
 */
static unsigned nvidia_bl_max_level_to_mask(unsigned max_level)
{
	int i;

	for (i = sizeof(unsigned) * 8 - 1; i >= 0; i--) {
		const unsigned bit = 1 << i;
		if (max_level & bit)
			return (bit << 1) - 1;
	}

	return (unsigned)-1;
}

/* missing annotation __devinitconst */
static const struct pci_device_id *nvidia_bl_match_id(struct pci_dev *dev)
{
	/* Search id in table */
	const struct pci_device_id *id =
		pci_match_id(nvidia_bl_device_table, dev);

#ifdef CONFIG_NVIDIA_BL_CHECK_SUBSYSTEM_VENDOR
	int i;
	if (id)
		/* ... and check subsystem vendor */
		for (i = 0; i < ARRAY_SIZE(nvidia_bl_subvendors); i++)
			if (dev->subsystem_vendor == nvidia_bl_subvendors[i])
				return id;
	return NULL;
#else
	return id;
#endif
}

/* missing annotation __devinitconst */
static int nvidia_bl_find_device(struct driver_data *dd)
{
	const struct pci_device_id *id = NULL;
	struct pci_dev *dev = NULL;

	/* For each PCI device */
	while ((dev = pci_get_device(PCI_VENDOR_ID_NVIDIA, dev_id, dev))) {
		/* ... Lookup id struct */
		if ((id = nvidia_bl_match_id(dev))) {
			dev_id = id->device;

			printk(KERN_INFO "nvidia_bl: Nvidia graphics adapter"
			       " %04x:%04x (%04x:%04x) detected\n",
			       id->vendor, id->device,
			       dev->subsystem_vendor, dev->subsystem_device);

			/* Setup driver data */
			*dd = *((struct driver_data *)id->driver_data);
			dd->dev = dev;
			return 0;
		}
		/* Load if forced unless not a graphics adapter */
		else if (force && (dev->class == PCI_CLASS_DISPLAY_VGA << 8)) {
			dev_id = id->device;

			printk(KERN_INFO "nvidia_bl: Nvidia graphics adapter"
			       " %04x:%04x (%04x:%04x) forced\n",
			       id->vendor, id->device,
			       dev->subsystem_vendor, dev->subsystem_device);

			/* Setup driver data (assume NV5X generation) */
			*dd = nv5x_driver_data;
			dd->dev = dev;
			return 0;
		}
	}

	/* Nothing found */
	if (dev_id != PCI_ANY_ID)
		printk(KERN_INFO "nvidia_bl: No Nvidia graphics adapter"
		       " with IDs %04x:%04x found\n",
		       PCI_VENDOR_ID_NVIDIA, dev_id);
	else
		printk(KERN_INFO "nvidia_bl: No supported Nvidia graphics"
		       " adapter found\n");

	return -ENODEV;
}

static int nvidia_bl_map_smartdimmer(struct driver_data *dd)
{
	/* Get resource properties */
	const unsigned long bar_start = pci_resource_start(dd->dev, dd->bar),
			    bar_end   = pci_resource_end(dd->dev, dd->bar),
			    bar_flags = pci_resource_flags(dd->dev, dd->bar);
	/* Calculate register address */
	const unsigned long reg_addr  = bar_start + dd->reg_offset;

	/* Sanity check 1: Should be a memory region containing registers */
	if (!(bar_flags & IORESOURCE_MEM))
		return -ENODEV;
	if (bar_flags & IORESOURCE_PREFETCH)
		return -ENODEV;

	/* Sanity check 2: Address should not exceed the PCI BAR */
	if (reg_addr + dd->reg_size - 1 > bar_end)
		return -ENODEV;

	if (unlikely(debug))
		printk(KERN_DEBUG "nvidia_bl: using BAR #%d at 0x%lx, "
		       "smartdimmer at 0x%lx\n", dd->bar, bar_start, reg_addr);

	/* Now really map (The address need not be page-aligned.) */
	dd->smartdimmer = ioremap_nocache(reg_addr, dd->reg_size);
	if (!dd->smartdimmer)
		return -ENXIO;

	return 0;
}

static void nvidia_bl_unmap_smartdimmer(struct driver_data *dd)
{
	iounmap(dd->smartdimmer);
}

/*
 * Backlight framework implementation.
 */
static int nvidia_bl_get_intensity(struct backlight_device *bd)
{
	const struct driver_data *dd = bl_get_data(bd);
	unsigned intensity = dd->ops.get_intensity(dd);

	intensity >>= shift;

	if (unlikely(debug))
		printk(KERN_DEBUG "nvidia_bl: read brightness of %d\n",
		       intensity);

	return intensity;
}

static int nvidia_bl_set_intensity(struct backlight_device *bd)
{
	struct driver_data *dd = bl_get_data(bd);
	unsigned intensity = bd->props.brightness;

#ifdef HAVE_BACKLIGHT_PROPS_STATE
	if (bd->props.state & BL_CORE_FBBLANK)
		intensity = 0;
	else if (bd->props.state & BL_CORE_SUSPENDED)
		intensity = 0;
#endif

	if (unlikely(debug))
		printk(KERN_DEBUG "nvidia_bl: setting brightness to %d\n",
		       intensity);

	intensity <<= shift;

	return dd->ops.set_intensity(dd, intensity);
}

static const struct backlight_ops nvidia_bl_backlight_ops = {
	.options        = BL_CORE_SUSPENDRESUME,
	.get_brightness = &nvidia_bl_get_intensity,
	.update_status  = &nvidia_bl_set_intensity,
};

/*
 * Driver implementation
 */
static struct driver_data driver_data;
static struct backlight_device *nvidia_bl_device;

static int __init nvidia_bl_init(void)
{
#ifdef INIT_BACKLIGHT_PROPS
	struct backlight_properties props;
#endif
	int err;

	/* Bail-out if PCI subsystem is not initialized */
	if (no_pci_devices())
		return -ENODEV;

	/* Check DMI */
	dmi_check_system(nvidia_bl_machine_table);

	/*
	 * Use the machine quirks from the machine table if present and not
	 * overridden by parameter
	 */
	if (nvidia_bl_dmi_system_id) {
		const struct machine_quirks *quirks =
			nvidia_bl_dmi_system_id->driver_data;
		if (quirks) {
			if (dev_id == PCI_ANY_ID)
				dev_id = quirks->dev_id;
			if (max_level == 0)
				max_level = quirks->max_level;
		}
	}

	/* Look for a supported PCI device */
	err = nvidia_bl_find_device(&driver_data);
	if (err)
		return err;

	/* Map smartdimmer */
	err = nvidia_bl_map_smartdimmer(&driver_data);
	if (err)
		return err;

#ifdef INIT_BACKLIGHT_PROPS
	/* Use a dummy here. Will be initialized later. */
	memset(&props, 0, sizeof(struct backlight_properties));
	/* Register at backlight framework */
	nvidia_bl_device = backlight_device_register("nvidia_backlight", NULL,
	                                             &driver_data,
	                                             &nvidia_bl_backlight_ops,
	                                             &props);
#else
	/* Register at backlight framework */
	nvidia_bl_device = backlight_device_register("nvidia_backlight", NULL,
	                                             &driver_data,
	                                             &nvidia_bl_backlight_ops);
#endif

	if (IS_ERR(nvidia_bl_device)) {
		nvidia_bl_unmap_smartdimmer(&driver_data);
		return PTR_ERR(nvidia_bl_device);
	}

	/* Use the max_level parameter only if it is in reasonable range */
	if (max_level > 0)
		driver_data.max_level = max_level;
	else
		max_level = driver_data.max_level;

	/* Compute the register mask */
	driver_data.reg_mask =
		nvidia_bl_max_level_to_mask(driver_data.max_level);

	/* Set up backlight device */
	nvidia_bl_device->props.brightness =
	nvidia_bl_device->props.max_brightness = driver_data.max_level >> shift;

	/* dump initial state if in debugging mode */
	if (unlikely(debug)) {
		printk(KERN_DEBUG "nvidia_bl: register mask: 0x%08x\n",
		       driver_data.reg_mask);
		nvidia_bl_device->ops->get_brightness(nvidia_bl_device);
	}

	/*
	 * MacBook Pro 5: Hardware might report the wrong value (maximum),
	 * so make sure it is right by resetting the brightness here.
	 */
	backlight_update_status(nvidia_bl_device);

	return 0;
}

static void __exit nvidia_bl_exit(void)
{
	/* Unregister at backlight framework */
	if (nvidia_bl_device)
		backlight_device_unregister(nvidia_bl_device);

	/* Unmap smartdimmer */
	if (driver_data.smartdimmer)
		nvidia_bl_unmap_smartdimmer(&driver_data);

	/* Release PCI device */
	if (driver_data.dev)
		pci_dev_put(driver_data.dev);
}

module_init(nvidia_bl_init);
module_exit(nvidia_bl_exit);

MODULE_AUTHOR("Mario Schwalbe <schwalbe@inf.tu-dresden.de>");
MODULE_DESCRIPTION("Nvidia-based graphics adapter display backlight driver");
MODULE_LICENSE("GPL");
MODULE_DEVICE_TABLE(dmi, nvidia_bl_machine_table);

