/*
 * Copyright (C) 2015 Adapteva Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * The full GNU General Public License is included in this distribution in the
 * file called COPYING.
 */

#include <linux/mm.h>
#include <linux/module.h>
#include <linux/device.h>
#include <linux/sched/mm.h> 
#include <linux/sched/task.h>
#include <linux/platform_device.h>
#include <linux/of.h>
#include <linux/of_address.h>
#include <linux/of_platform.h>
#include <linux/clk.h>
#include <linux/ioctl.h>
#include <linux/fs.h>
#include <linux/delay.h>
#include <linux/io.h>
#include <linux/mm.h>
#include <linux/list.h>
#include <linux/uaccess.h>
#include <linux/mutex.h>
#include <linux/spinlock.h>
#include <linux/regulator/consumer.h>
#include <linux/slab.h>
#include <linux/cdev.h>
#include <linux/interrupt.h>
#include <linux/wait.h>

#include "epiphany.h"

#define DRIVERNAME	"epiphany"

#define E_DEV_NUM_MINORS	MINORMASK	/* Total to reserve */

#define COREID_SHIFT 20
#define COREID_MASK ((1 << COREID_SHIFT) - 1)

/* Be careful, no range check */
#define COORDS(row, col) ((row) * 64 | (col))
#define ROW(coreid) ((coreid) / 64)
#define COL(coreid) ((coreid) % 64)

struct epiphany_vma_entry {
	struct list_head	list;
	struct vm_area_struct	*vma;
	struct pid		*pid;
	atomic_t		in_use;
};

static struct epiphany {
	struct class		class;
	int			u_count; /* User count */

	struct list_head	elink_list;
	struct list_head	chip_array_list;
	struct list_head	mesh_list;

	struct list_head	vma_list;

	dev_t			devt;

	struct idr		minor_idr;
	/* Used by minor_get() / minor_put() */
	spinlock_t		minor_idr_lock;

	/* For device naming */
	atomic_t		elink_counter;
	atomic_t		mesh_counter;
	atomic_t		array_counter;

	/* One big lock for everything */
	struct mutex		driver_lock;

	/* For thermal daemon (protected by driver lock) */
	bool			thermal_disallow;

	/* Module parameters */
	bool			param_unsafe_access; /* access to fpga regs */
	bool			param_nopm; /* disable power management */
} epiphany = {};

module_param_named(unsafe_access, epiphany.param_unsafe_access, bool, 0644);
MODULE_PARM_DESC(unsafe_access, "Permit access to elink FPGA registers");

module_param_named(nopm, epiphany.param_nopm, bool, 0444);
MODULE_PARM_DESC(nopm, "Disable power management");

static const u32 ctrlmode_hints[E_SIDE_MAX] = {
	[E_SIDE_N] = E_CTRLMODE_NORTH,
	[E_SIDE_E] = E_CTRLMODE_EAST,
	[E_SIDE_S] = E_CTRLMODE_SOUTH,
	[E_SIDE_W] = E_CTRLMODE_WEST
};

enum performance_state {
	E_PS_HIGHEST = 0,
	E_PS_LOWEST,
	E_PS_NUM_STATES
};

struct performance_state_cfg {
	int vdd_thresh;

	u32 linkcfg_tx_divider;
};

struct epiphany_chip_info {
	int rows;
	int cols;
	size_t core_mem;
	u16 elink_coreid[E_SIDE_MAX]; /* relative */

	/* In uVolts */
	int vdd_min;
	int vdd_max;

	u32 linkcfg_tx_divider;

	struct performance_state_cfg perf_state[E_PS_NUM_STATES];
};
static const struct epiphany_chip_info epiphany_chip_info[E_CHIP_MAX] = {
	/* Safe values when chip is unknown. */
	[E_CHIP_UNKNOWN] = {
		.vdd_min	=  900000,
		.vdd_max	= 1025000,

		.perf_state = {
			[E_PS_HIGHEST] = {
				.vdd_thresh = 1000000,
				.linkcfg_tx_divider = 1
			},
			[E_PS_LOWEST] = {
				.vdd_thresh = 1000000,
				.linkcfg_tx_divider = 1
			}
		}
	},
	[E_CHIP_E16G301] = {
		.rows = 4,
		.cols = 4,
		.core_mem = 32768,

		.elink_coreid[E_SIDE_N] = COORDS(0, 2),
		.elink_coreid[E_SIDE_E] = COORDS(2, 3),
		.elink_coreid[E_SIDE_S] = COORDS(3, 2),
		.elink_coreid[E_SIDE_W] = COORDS(2, 0),

		/* Recommended operating conditions */
		.vdd_min	=  900000,
		.vdd_max	= 1200000,

		.linkcfg_tx_divider = 1,

		.perf_state = {
			[E_PS_HIGHEST] = {
				.vdd_thresh = 1000000,
				.linkcfg_tx_divider = 0
			},
			/* TODO: Verify */
			[E_PS_LOWEST] = {
				.vdd_thresh = 900000,
				.linkcfg_tx_divider = 1
			}
		}
	},
	[E_CHIP_E64G401] = {
		.rows = 8,
		.cols = 8,
		.core_mem = 32768,

		.elink_coreid[E_SIDE_N] = COORDS(0, 2),
		.elink_coreid[E_SIDE_E] = COORDS(2, 7),
		.elink_coreid[E_SIDE_S] = COORDS(7, 2),
		.elink_coreid[E_SIDE_W] = COORDS(2, 0),

		/* Recommended operating conditions */
		.vdd_min	=  900000,
		.vdd_max	= 1100000,

		.linkcfg_tx_divider = 0,

		/* TODO: Verify */
		.perf_state = {
			[E_PS_HIGHEST] = {
				.vdd_thresh = 1000000,
				.linkcfg_tx_divider = 0
			},
			[E_PS_LOWEST] = {
				.vdd_thresh = 900000,
				.linkcfg_tx_divider = 1
			}
		}
	}
};

enum elink_generation {
	E_GEN_INVAL = 0,
	E_GEN_PARALLELLA1,
	E_GEN_MAX
};

enum elink_platform {
	E_PLATF_UNKNOWN = 0,
	E_PLATF_E16_7Z020_GPIO,
	E_PLATF_E16_7Z020_NO_GPIO,
	E_PLATF_E16_7Z010_GPIO,
	E_PLATF_E16_7Z010_NO_GPIO,
	E_PLATF_E64_7Z020_GPIO,
	E_PLATF_MAX
};

static const enum e_chip_type elink_platform_chip_match[E_PLATF_MAX] = {
	[E_PLATF_UNKNOWN]		= E_CHIP_UNKNOWN,
	[E_PLATF_E16_7Z020_GPIO]	= E_CHIP_E16G301,
	[E_PLATF_E16_7Z020_NO_GPIO]	= E_CHIP_E16G301,
	[E_PLATF_E16_7Z010_GPIO]	= E_CHIP_E16G301,
	[E_PLATF_E16_7Z010_NO_GPIO]	= E_CHIP_E16G301,
	[E_PLATF_E64_7Z020_GPIO]	= E_CHIP_E64G401
};

struct connection {
	enum e_connection_type type; /* remote type */
	enum e_link_side side; /* remote side */
	union {
		struct elink_device *elink;
		struct array_device *array;
	};

	phandle phandle;
};

struct elink_device {
	struct list_head list;
	struct device dev;

	void __iomem *regs;
	phys_addr_t regs_start;
	size_t regs_size;

	/* TODO: Rename */
	/* Host --> emesh bus address range */
	phys_addr_t emesh_start;
	size_t emesh_size;

	struct clk **clocks;

	/* Power supply */
	struct regulator *supply;
	int vdd_wanted;

	s16 coreid_pinout; /* core id pinout */
	bool coreid_is_noop;

	union elink_version version;
	enum e_chip_type chip_type;

	struct connection connection;

	/* TODO: Have our own cdev */
	struct cdev cdev;
	int minor;

	/* Available memory regions */
	struct list_head mem_region_list;

	/* Mapped memory regions */
	struct list_head mappings_list;

	wait_queue_head_t mailbox_wait;
	struct work_struct mailbox_irq_work;
	atomic_t mailbox_maybe_not_empty;

	phandle phandle;
};

struct array_device {
	struct list_head list;

	struct device dev;

	u16 id; /* north-west-most core */
	unsigned int chip_rows;
	unsigned int chip_cols;
	enum e_chip_type chip_type;

	enum e_link_side parent_side; /* Side of array array is connected to to
					parent elink */
	struct connection connections[E_SIDE_MAX];

	struct mesh_device *mesh;

	phandle phandle;
};

struct mesh_device {
	struct list_head list;
	struct device dev;

	struct cdev cdev;
	int minor;

	struct array_device **arrays;
};


struct mem_region {
	struct list_head list;
	phys_addr_t start;
	phys_addr_t emesh_start;
	size_t size;

	phandle phandle;
};

/* Return the maximum performance state the chip array can currently do, not
 * taking its neighbours into account */
static enum performance_state
array_get_max_perf_state(const struct array_device *array)
{
	int curr_vdd;
	enum performance_state i;
	struct elink_device *elink;
	const struct epiphany_chip_info *cinfo =
		&epiphany_chip_info[array->chip_type];

	elink = array->connections[array->parent_side].elink;

	if (!elink || !elink->supply)
		return E_PS_LOWEST;

	curr_vdd = regulator_get_voltage(elink->supply);
	for (i = E_PS_HIGHEST; i < E_PS_NUM_STATES; i++) {
		if (curr_vdd >= cinfo->perf_state[i].vdd_thresh)
			return i;
	}

	/* Out of spec */

	return E_PS_LOWEST;
}

static inline void reg_write(u32 value, void __iomem *base, u32 offset)
{
	iowrite32(value, (u8 __iomem *)base + offset);
}

static inline void reg_write64(u64 value, void __iomem *base, u32 offset)
{
	reg_write((u32) (value & 0xffffffff), base, offset);
	reg_write((u32) (value >> 32), base, offset + 4);
}

static inline u32 reg_read(void __iomem *base, u32 offset)
{
	return ioread32((u8 __iomem *)base + offset);
}

static inline struct elink_device *file_to_elink(struct file *file)
{
	return container_of(file->private_data, struct elink_device, cdev);
}

static inline struct elink_device *device_to_elink(struct device *dev)
{
	return container_of(dev, struct elink_device, dev);
}

static inline struct array_device *device_to_array(struct device *dev)
{
	return container_of(dev, struct array_device, dev);
}

static inline struct mesh_device *device_to_mesh(struct device *dev)
{
	return container_of(dev, struct mesh_device, dev);
}

static inline struct mesh_device *file_to_mesh(struct file *file)
{
	return container_of(file->private_data, struct mesh_device, cdev);
}

static inline struct elink_device *vma_to_elink(struct vm_area_struct *vma)
{
	return file_to_elink(vma->vm_file);
}

static inline struct epiphany_vma_entry *
vma_to_epiphany_vma_entry(struct vm_area_struct *vma)
{
	return (struct epiphany_vma_entry *) vma->vm_private_data;
}

static int coreid_to_phys(struct elink_device *elink, u16 coreid,
			  phys_addr_t *out)
{
	u32 rel_coreid, rel_row, rel_col;
	struct array_device *array = elink->connection.array;
	const struct epiphany_chip_info *cinfo;
	phys_addr_t offs;

	if (elink->connection.type != E_CONN_ARRAY)
		return -EINVAL;

	if (coreid < array->id)
		return -ERANGE;

	cinfo = &epiphany_chip_info[array->chip_type];
	rel_coreid = coreid - array->id;
	rel_row = ROW(rel_coreid);
	rel_col = COL(rel_coreid);

	if (rel_row >= array->chip_rows * cinfo->rows)
		return -ERANGE;

	if (rel_col >= array->chip_cols * cinfo->cols)
		return -ERANGE;

	/* Offset from array start */
	offs = ((phys_addr_t) rel_coreid) << ((phys_addr_t) COREID_SHIFT);

	/* Adjust for offset from elink mem region (align by row) */
	offs += ((phys_addr_t) COL(array->id)) << ((phys_addr_t) COREID_SHIFT);

	if (offs >= elink->emesh_size)
		return -ERANGE;

	*out = offs + elink->emesh_start;

	return 0;
}

/* Disable chip elink */
static void elink_disable_chip_elink(struct elink_device *elink,
				     struct array_device *array,
				     u16 chipid,
				     enum e_link_side side)
{
	int err;
	const struct epiphany_chip_info *cinfo =
		&epiphany_chip_info[array->chip_type];
	phys_addr_t core_phys, regs_phys;
	u16 coreid;
	void __iomem *regs;
	union elink_txcfg txcfg;

	coreid = chipid + cinfo->elink_coreid[side];

	dev_dbg(&elink->dev,
		"Disabling elink 0x%03x (%02u, %02u) in array 0x%03x.\n",
		coreid, ROW(coreid), COL(coreid), array->id);

	err = coreid_to_phys(elink, coreid, &core_phys);
	WARN_ON(err);
	if (err)
		return;

	regs_phys = (core_phys | E_REG_BASE) & PAGE_MASK;
	regs = ioremap_nocache(regs_phys, PAGE_SIZE);
	WARN_ON(!regs);
	if (!regs)
		return;

	txcfg.reg = reg_read(elink->regs, ELINK_TXCFG);
	txcfg.ctrlmode = ctrlmode_hints[side];
	reg_write(txcfg.reg, elink->regs, ELINK_TXCFG);

	reg_write(0xfff, regs, E_REG_LINKTXCFG & ~PAGE_MASK);
	reg_write(0xfff, regs, E_REG_LINKRXCFG & ~PAGE_MASK);

	txcfg.ctrlmode = 0;
	reg_write(txcfg.reg, elink->regs, ELINK_TXCFG);

	iounmap(regs);
}

static void array_disable_disconnected_elinks(struct elink_device *elink,
					      struct array_device *array)
{
	int i;
	const struct epiphany_chip_info *cinfo =
		&epiphany_chip_info[array->chip_type];
	enum e_link_side side;
	u32 mask = 0;
	u16 north_chip, south_chip, east_chip, west_chip;

	for (side = 0; side < ARRAY_SIZE(array->connections); side++) {
		if (array->connections[side].type == E_CONN_DISCONNECTED)
			mask |= 1 << side;

	}

	/* Walk north and south cols */
	if (mask & ((1 << E_SIDE_N) | (1 << E_SIDE_S))) {
		for (i = 0, north_chip = array->id;
		     i < array->chip_cols;
		     i++, north_chip += cinfo->cols) {
			south_chip = north_chip +
				COORDS((array->chip_rows - 1) * cinfo->rows, 0);

			if (mask & (1 << E_SIDE_N)) {
				elink_disable_chip_elink(elink, array,
							 north_chip, E_SIDE_N);
			}
			if (mask & (1 << E_SIDE_S)) {
				elink_disable_chip_elink(elink, array,
							 south_chip, E_SIDE_S);
			}
		}
	}

	/* Walk east and west rows */
	if (mask & ((1 << E_SIDE_E) | (1 << E_SIDE_W))) {
		for (i = 0, west_chip = array->id;
		     i < array->chip_rows;
		     i++, west_chip += COORDS(1, 0)) {
			east_chip = west_chip +
				COORDS(0, (array->chip_cols - 1) * cinfo->cols);

			if (mask & (1 << E_SIDE_W)) {
				elink_disable_chip_elink(elink, array,
							 west_chip, E_SIDE_W);
			}
			if (mask & (1 << E_SIDE_E)) {
				elink_disable_chip_elink(elink, array,
							 east_chip, E_SIDE_E);
			}
		}
	}
}

static void array_enable_clock_gating(struct elink_device *elink,
				      struct array_device *array)
{
	int err, i, j, row0, col0, last_row, last_col;
	const struct epiphany_chip_info *cinfo =
		&epiphany_chip_info[array->chip_type];
	phys_addr_t core, paddr;
	void __iomem *core_mem;
	u32 config, meshconfig;

	row0 = ROW(array->id);
	col0 = COL(array->id);
	last_row = row0 + array->chip_rows * cinfo->rows;
	last_col = col0 + array->chip_cols * cinfo->cols;

	for (i = row0; i < last_row; i++) {
		for (j = col0; j < last_col; j++) {
			err = coreid_to_phys(elink, COORDS(i, j), &core);
			WARN_ON(err);
			if (err)
				continue;

			paddr = (core | E_REG_BASE) & PAGE_MASK;
			core_mem = ioremap_nocache(paddr, PAGE_SIZE);
			WARN_ON(!core_mem);
			if (!core_mem)
				continue;


			config = E_REG_CONFIG & ~(PAGE_MASK);
			reg_write(0x00400000, core_mem, config);

			meshconfig = E_REG_MESHCONFIG & ~(PAGE_MASK);
			reg_write(0x00000002, core_mem, meshconfig);

			iounmap(core_mem);
		}
	}
}

static int configure_chip_tx_divider(struct elink_device *elink,
				     u16 chipid,
				     enum e_link_side side)
{
	int err;
	struct array_device *array = elink->connection.array;
	const struct epiphany_chip_info *cinfo =
		&epiphany_chip_info[array->chip_type];
	phys_addr_t core_phys, regs_phys;
	u16 coreid;
	u32 divider;
	void __iomem *regs;
	union elink_txcfg txcfg;
	u32 offset;
	enum performance_state ps;

	ps = array_get_max_perf_state(elink->connection.array);
	divider = cinfo->perf_state[ps].linkcfg_tx_divider;

	coreid = chipid + cinfo->elink_coreid[side];

	txcfg.reg = reg_read(elink->regs, ELINK_TXCFG);
	txcfg.ctrlmode = ctrlmode_hints[side];

	err = coreid_to_phys(elink, coreid, &core_phys);
	WARN_ON(err);
	if (err)
		return err;

	regs_phys = (core_phys | E_REG_BASE) & PAGE_MASK;
	regs = ioremap_nocache(regs_phys, PAGE_SIZE);
	offset = E_REG_LINKCFG & ~(PAGE_MASK);
	WARN_ON(!regs);
	if (!regs)
		return -EIO;

	txcfg.reg = reg_read(elink->regs, ELINK_TXCFG);
	txcfg.ctrlmode = ctrlmode_hints[side];
	reg_write(txcfg.reg, elink->regs, ELINK_TXCFG);

	reg_write(divider, regs, offset);

	txcfg.ctrlmode = 0;
	reg_write(txcfg.reg, elink->regs, ELINK_TXCFG);

	iounmap(regs);
	return 0;
}

static int configure_adjacent_links(struct elink_device *elink)
{
	int i;
	const struct epiphany_chip_info *cinfo;
	struct array_device *array;
	u16 north_chip, south_chip, east_chip, west_chip, the_chip;
	enum e_link_side side;

	if (elink->connection.type != E_CONN_ARRAY)
		return 0;

	BUG_ON(!elink->connection.array);

	array = elink->connection.array;
	cinfo = &epiphany_chip_info[array->chip_type];
	side = elink->connection.side;

	switch (side) {
	case E_SIDE_N:
	case E_SIDE_S:
		for (i = 0, north_chip = array->id;
		     i < array->chip_cols;
		     i++, north_chip += cinfo->cols) {
			south_chip = north_chip +
				COORDS((array->chip_rows - 1) * cinfo->rows, 0);
			the_chip = side == E_SIDE_N ? north_chip : south_chip;
			return configure_chip_tx_divider(elink, the_chip, side);
		}
	case E_SIDE_E:
	case E_SIDE_W:
		for (i = 0, west_chip = array->id;
		     i < array->chip_rows;
		     i++, west_chip += COORDS(1, 0)) {
			east_chip = west_chip +
				COORDS(0, (array->chip_cols - 1) * cinfo->cols);
			the_chip = side == E_SIDE_W ? west_chip : east_chip;
			return configure_chip_tx_divider(elink, the_chip, side);
		}
	default:
		WARN_ON(true);
		return -EINVAL;
	}
}

static void elink_update_mmu_mappings(struct elink_device *elink)
{
	const u32 mmu_base = 0xe8000;
	struct mem_region *mapping;
	u32 mmu_entry;
	u64 phys_addr;

	list_for_each_entry(mapping, &elink->mappings_list, list) {
		mmu_entry = mmu_base + ((mapping->emesh_start >> 20) << 3);
		phys_addr = mapping->start;
		for (; phys_addr - mapping->start < mapping->size;
				phys_addr += (1 << 20), mmu_entry += 8) {
			dev_dbg(&elink->dev, "%s: mapping 0x%03x -> 0x%03llx\n",
				__func__, (mmu_entry - mmu_base) >> 3,
				phys_addr >> 20);
			reg_write64(phys_addr >> 20, elink->regs, mmu_entry);
		}
	}
	/* Map in the elink regs so the chip-array can access the mailbox
	 * registers. FIXME: Not always this simple (phys addr == epiphany
	 * addr) */
	reg_write64(elink->regs_start >> 20, elink->regs,
			mmu_base + (elink->regs_start >> (20 - 3)));
}

/* Reset the Epiphany platform */
static int elink_reset(struct elink_device *elink)
{
	/* TODO: Should be able to provide via device tree */
	const u32 rxdelay0 = 0xaaaaaaaa;
	const u32 rxdelay1 = 0x0000000a;

	int ret = 0;
	union elink_reset reset = {0};
	union elink_txcfg txcfg = {0};
	union elink_rxcfg rxcfg = {0};

	/* assert reset */
	reset.tx_reset = 1;
	reset.rx_reset = 1;
	reg_write(reset.reg, elink->regs, ELINK_RESET);

	usleep_range(500, 600);

	/* de-assert reset */
	reset.tx_reset = 0;
	reset.rx_reset = 0;
	reg_write(reset.reg, elink->regs, ELINK_RESET);

	usleep_range(500, 600);

	reg_write(elink->coreid_pinout, elink->regs, ELINK_CHIPID);

	reg_write(rxdelay0, elink->regs, ELINK_RXDELAY0);
	reg_write(rxdelay1, elink->regs, ELINK_RXDELAY1);

	txcfg.enable = 1;
	reg_write(txcfg.reg, elink->regs, ELINK_TXCFG);


	/* HACK: Use static remapping until this is fixed:
	 * "Consecutive writes to rxmmu table results in system freeze"
	 * https://github.com/parallella/oh/issues/50
	 */
#if 0
	rxcfg.mmu_enable = 1;
	rxcfg.remap_mode = 0; /* no remapping, only mmu */
	reg_write(rxcfg.reg, elink->regs, ELINK_RXCFG);

	elink_update_mmu_mappings(elink);
#else
	rxcfg.remap_mode = 1;
	rxcfg.remap_sel = 0xfe0;
	rxcfg.remap_pattern = 0x3e0;
	reg_write(rxcfg.reg, elink->regs, ELINK_RXCFG);
#endif

	ret = configure_adjacent_links(elink);

	return ret;
}

static void elink_disable(struct elink_device *elink)
{
	union elink_txcfg txcfg = { .enable = 0 };
	union elink_reset reset = { .tx_reset = 1, .rx_reset = 1 };

	reg_write(txcfg.reg, elink->regs, ELINK_TXCFG);
	/* TODO: Don't we also need rxcfg.enable -> 0 ??? */

	reg_write(reset.reg, elink->regs, ELINK_RESET);

	usleep_range(500, 600);
}

static int elink_regulator_enable(struct elink_device *elink)
{
	int ret, i, old_vdd, new_vdd, step, wiggle;
	bool extra_delay;
	const struct epiphany_chip_info *cinfo =
		&epiphany_chip_info[elink->chip_type];

	if (!elink->supply)
		return 0;

	old_vdd = regulator_get_voltage(elink->supply);
	if (old_vdd < 0)
		return old_vdd;

	new_vdd = min(old_vdd, cinfo->vdd_max);
	step = regulator_get_linear_step(elink->supply);

	ret = -EINVAL;

	if (cinfo->vdd_min <= elink->vdd_wanted &&
	    elink->vdd_wanted <= cinfo->vdd_max) {
		new_vdd = elink->vdd_wanted;
		wiggle = min(new_vdd + step, cinfo->vdd_max);
		ret = regulator_set_voltage(elink->supply, elink->vdd_wanted,
					    wiggle);
	}

	if (ret) {
		for (i = 0; i < E_PS_NUM_STATES; i++) {
			new_vdd = cinfo->perf_state[i].vdd_thresh;
			wiggle = min(new_vdd + step, cinfo->vdd_max);
			ret = regulator_set_voltage(elink->supply,
					new_vdd, wiggle);
			if (!ret)
				break;
		}
	}
	if (ret)
		return ret;

	/* Pessimistic sleep if regulator doesn't provide a ramp-up time, then
	 * it didn't block in regulator_set_voltage(). ???: And will also
	 * not block in regulator_enable() ??? */

	extra_delay =
		(0 >= regulator_set_voltage_time(elink->supply,
						 cinfo->vdd_min,
						 cinfo->vdd_max))
		? true : false;

	if (extra_delay && old_vdd != new_vdd)
		msleep(100);

	ret = regulator_enable(elink->supply);

	if (extra_delay)
		usleep_range(20000, 20100);

	return ret;
}

static void elink_regulator_disable(struct elink_device *elink)
{
	if (elink->supply)
		regulator_disable(elink->supply);

	usleep_range(2000, 2100);
}

static void elink_mailbox_irq_enable(struct elink_device *elink)
{
	union elink_rxcfg cfg;

	cfg.reg = reg_read(elink->regs, ELINK_RXCFG);
	cfg.mailbox_irq_en = 1;
	reg_write(cfg.reg, elink->regs, ELINK_RXCFG);
}

static void elink_mailbox_irq_disable(struct elink_device *elink)
{
	union elink_rxcfg cfg;

	cfg.reg = reg_read(elink->regs, ELINK_RXCFG);
	cfg.mailbox_irq_en = 0;
	reg_write(cfg.reg, elink->regs, ELINK_RXCFG);
}

static bool elink_mailbox_empty_p(struct elink_device *elink)
{
	union elink_mailboxstat status;

	status.reg = reg_read(elink->regs, ELINK_MAILBOXSTAT);

	return !status.not_empty;
}

static unsigned elink_mailbox_count(struct elink_device *elink)
{
	union elink_mailboxstat status;

	status.reg = reg_read(elink->regs, ELINK_MAILBOXSTAT);

	return status.count;
}

static void elink_mailbox_irq_handler_bh(struct work_struct *ws)
{
	bool empty;
	struct elink_device *elink =
		container_of(ws, struct elink_device, mailbox_irq_work);

	mutex_lock(&epiphany.driver_lock);
	empty = elink_mailbox_empty_p(elink);
	if (!empty) {
		elink_mailbox_irq_disable(elink);
		atomic_set(&elink->mailbox_maybe_not_empty, 1);
	}
	mutex_unlock(&epiphany.driver_lock);

	if (!empty)
		wake_up(&elink->mailbox_wait);
}

static irqreturn_t elink_mailbox_irq_handler(int irq, void *dev_id)
{
	struct elink_device *elink = dev_id;

	schedule_work(&elink->mailbox_irq_work);

	/* We don't know if we caused interrupt */
	return IRQ_HANDLED;
}

static int epiphany_vm_freeze(bool interruptible)
{
	unsigned long jiffies_expire = jiffies + HZ * 10;
	struct epiphany_vma_entry *vma_entry;

retry:
	/* Give up after trying 10 seconds */
	if (time_after(jiffies, jiffies_expire))
		return -EBUSY;

	if (interruptible) {
		if (mutex_lock_interruptible(&epiphany.driver_lock))
			return -ERESTARTSYS;
	} else {
		mutex_lock(&epiphany.driver_lock);
	}

	list_for_each_entry(vma_entry, &epiphany.vma_list, list) {
		struct task_struct *task;
		struct mm_struct *mm;

		task = get_pid_task(vma_entry->pid, PIDTYPE_PID);
		if (!task)
			continue;

		mm = get_task_mm(task);
		if (!mm) {
			put_task_struct(task);
			continue;
		}

		if (!down_read_trylock(&mm->mmap_sem)) {
			mmput(mm);
			put_task_struct(task);
			mutex_unlock(&epiphany.driver_lock);
			schedule();
			goto retry;
		}
		if (atomic_read(&vma_entry->in_use)) {
			struct vm_area_struct *vma = vma_entry->vma;
			zap_vma_ptes(vma, vma->vm_start,
				     vma->vm_end - vma->vm_start);
		}
		up_read(&mm->mmap_sem);

		mmput(mm);
		put_task_struct(task);
	}

	usleep_range(500, 600);

	return 0;
}

static void epiphany_vm_unfreeze(void)
{
	usleep_range(500, 600);
	mutex_unlock(&epiphany.driver_lock);
}

static int epiphany_reset(void)
{
	struct elink_device *elink;
	int err;

	/* Unsafe to manipulate power if already in use. At any rate we should
	 * not call regulator_enable() again since that would screw up the
	 * regulator's refcount */
	if (!epiphany.u_count) {
		list_for_each_entry(elink, &epiphany.elink_list, list) {
			if (elink_regulator_enable(elink)) {
				/* Not much else we can do? */
				return -EIO;
			}
		}
	}

	list_for_each_entry(elink, &epiphany.elink_list, list) {
		err = elink_reset(elink);
		if (err)
			return -EIO;
	}

	if (epiphany.param_nopm)
		return 0;

	list_for_each_entry(elink, &epiphany.elink_list, list) {
		if (elink->connection.type != E_CONN_ARRAY)
			continue;
		array_enable_clock_gating(elink, elink->connection.array);
		array_disable_disconnected_elinks(elink,
						  elink->connection.array);
	}

	return 0;
}

/* caller must hold epiphany.driver_lock */
static int _epiphany_get(void)
{
	int ret;

	if (!epiphany.u_count) {
		/* if !epiphany.param_no_reset (or no power mgmt) */
		ret = epiphany_reset();
		if (ret)
			return ret;
	}

	epiphany.u_count++;

	return 0;
}

static int epiphany_get(void)
{
	int ret;

	mutex_lock(&epiphany.driver_lock);
	ret = _epiphany_get();
	mutex_unlock(&epiphany.driver_lock);

	return ret;
}

static int epiphany_get_interruptible(void)
{
	int ret;

	if (mutex_lock_interruptible(&epiphany.driver_lock))
		return -ERESTARTSYS;
	ret = _epiphany_get();
	mutex_unlock(&epiphany.driver_lock);

	return ret;
}

static void epiphany_put(void)
{
	struct elink_device *elink;

	mutex_lock(&epiphany.driver_lock);

	epiphany.u_count--;

	if (epiphany.u_count) {
		mutex_unlock(&epiphany.driver_lock);
		return;
	}

	list_for_each_entry(elink, &epiphany.elink_list, list)
		elink_disable(elink);

	list_for_each_entry(elink, &epiphany.elink_list, list)
		elink_regulator_disable(elink);

	pr_debug("epiphany: no users\n");

	mutex_unlock(&epiphany.driver_lock);
}

static int char_open(struct inode *inode, struct file *file)
{
	file->private_data = inode->i_cdev;

	return epiphany_get_interruptible();
}

static int mesh_char_open(struct inode *inode, struct file *file)
{
	struct array_device *array;
	struct elink_device *elink;
	struct mesh_device *mesh;

	mesh = container_of(inode->i_cdev, struct mesh_device, cdev);

	array = mesh->arrays[0];
	if (!array)
		return -EINVAL;

	elink = array->connections[array->parent_side].elink;
	if (!elink)
		return -EINVAL;

	file->private_data = &elink->cdev;

	return epiphany_get_interruptible();
}

static int char_release(struct inode *inode, struct file *file)
{
	epiphany_put();

	return 0;
}

static void epiphany_vm_open(struct vm_area_struct *vma)
{
	struct epiphany_vma_entry *vma_entry;

	mutex_lock(&epiphany.driver_lock);

	vma_entry = kzalloc(sizeof(*vma_entry), GFP_KERNEL);
	if (!vma_entry)
		goto out;

	vma_entry->vma = vma;
	vma_entry->pid = get_task_pid(current, PIDTYPE_PID);
	atomic_set(&vma_entry->in_use, 1);

	vma->vm_private_data = vma_entry;

	list_add_tail(&vma_entry->list, &epiphany.vma_list);

out:
	mutex_unlock(&epiphany.driver_lock);
}

static void epiphany_vm_close(struct vm_area_struct *vma)
{
	struct epiphany_vma_entry *vma_entry;

	mutex_lock(&epiphany.driver_lock);

	vma_entry = vma_to_epiphany_vma_entry(vma);

	if (!vma_entry) {
		mutex_unlock(&epiphany.driver_lock);
		return;
	}

	if (atomic_dec_and_test(&vma_entry->in_use)) {
		list_del(&vma_entry->list);
		put_pid(vma_entry->pid);
		kfree(vma_entry);
	} else {
		WARN_ON(true);
	}
	vma->vm_private_data = NULL;
	mutex_unlock(&epiphany.driver_lock);
}

/* Epiphany mesh pfn to phys pfn
 * &epiphany.driver_lock must be held by caller
 * TODO: ???: Replace elink with vm_area_struct or mesh_device */
static int mesh_pfn_to_phys_pfn(struct elink_device *elink, unsigned long pfn,
				unsigned long *phys_pfn)
{
	const u16 coreid = pfn >> (COREID_SHIFT - PAGE_SHIFT);
	const phys_addr_t core_offs = PFN_PHYS(pfn) & COREID_MASK;
	const phys_addr_t core_end = core_offs + PAGE_SIZE;
	const phys_addr_t start = PFN_PHYS(pfn);
	const phys_addr_t end = PFN_PHYS(pfn + 1);
	const struct epiphany_chip_info *cinfo =
		&epiphany_chip_info[elink->chip_type];
	unsigned offs;
	phys_addr_t core_phys_addr;
	struct mem_region *mapping;

	if (end < start) {
		WARN(1, "overflow");
		return -EOVERFLOW;
	}

	if (!coreid_to_phys(elink, coreid, &core_phys_addr)) {
		/* sram */
		if (core_end <= cinfo->core_mem) {
			*phys_pfn = PFN_DOWN(core_phys_addr + core_offs);
			return 0;
		}

		/* registers.
		 * N.B: End is rounded up from 0xf0800 to page boundary */
		if (0xf0000 <= core_offs && core_end <= 0xf1000) {
			*phys_pfn = PFN_DOWN(core_phys_addr + core_offs);
			return 0;
		}

		return -EINVAL;
	}

	list_for_each_entry(mapping, &elink->mappings_list, list) {
		if (mapping->emesh_start <= start &&
		    end <= mapping->emesh_start + mapping->size) {
			offs = start - mapping->emesh_start;
			*phys_pfn = PFN_DOWN(mapping->start + offs);
			return 0;
		}
	}

	if (elink->regs_start <= start &&
	    end <= elink->regs_start + elink->regs_size) {
		if (epiphany.param_unsafe_access) {
			*phys_pfn = PFN_DOWN(start);
			return 0;
		} else
			return -EACCES;
	}

	return -EINVAL;
}

static unsigned int epiphany_vm_fault(struct vm_fault *vmf)
{
	unsigned long phys_pfn;
	struct elink_device *elink = vma_to_elink(vmf->vma);
	int ret;

	if (mutex_lock_interruptible(&epiphany.driver_lock)) {
		ret = -ERESTARTSYS;
		goto out;
	}

	if (epiphany.thermal_disallow) {
		pr_info_ratelimited("%s: Temperature outside operating range. Sending SIGBUS to process %s (pid: %d)\n",
				     __func__, current->comm,
				     task_pid_nr(current));
		ret = -EACCES;
		goto out_unlock;
	}

	ret = mesh_pfn_to_phys_pfn(elink, vmf->pgoff, &phys_pfn);
	if (ret)
		goto out_unlock;

	ret = vmf_insert_pfn(vmf->vma, (unsigned long)vmf->address, phys_pfn);

out_unlock:
	mutex_unlock(&epiphany.driver_lock);
out:
	switch (ret) {
	case 0:
	case -ERESTARTSYS:
	case -EINTR:
	case -EBUSY:
		return VM_FAULT_NOPAGE;
	default:
		return VM_FAULT_SIGBUS;
	}
}

static const struct vm_operations_struct epiphany_vm_ops = {
	.open = epiphany_vm_open,
	.close = epiphany_vm_close,
	.fault = epiphany_vm_fault,
#ifdef CONFIG_HAVE_IOREMAP_PROT
	.access = generic_access_phys
#endif
};

static int _elink_char_mmap(struct elink_device *elink,
			    struct vm_area_struct *vma)
{
	int ret;
	unsigned long off, size, coreoff, phys_off;
	struct mem_region *mapping;
	phys_addr_t core_phys = 0;

	vma->vm_ops = &epiphany_vm_ops;
	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;

	off = vma->vm_pgoff << PAGE_SHIFT;
	size = vma->vm_end - vma->vm_start;

	/* Check memory mappings first. These can be inside the Epiphany memory
	 * region of an elink. But they are flat 1D mappings with no holes so
	 * they are easy to check. */
	list_for_each_entry(mapping, &elink->mappings_list, list) {
		if (mapping->emesh_start <= off &&
		    off + size <= mapping->emesh_start + mapping->size) {
			epiphany_vm_open(vma);
			return 0;
		}
	}

	if (elink->regs_start <= off &&
	    off + size <= elink->regs_start + elink->regs_size) {
		if (epiphany.param_unsafe_access) {
			vma->vm_flags |= VM_IO;
			epiphany_vm_open(vma);
			return 0;
		}
		else
			return -EACCES;
	}

	/* TODO: Need a fault handler to make this safe. We want to allow
	 * mmapping an entire mesh/chip, which means there can be holes which
	 * should result in segfaults if accessed. */
	coreoff = off >> COREID_SHIFT;
	ret = coreid_to_phys(elink, (u16) coreoff, &core_phys);
	phys_off = core_phys | (off & COREID_MASK);
	if (!ret && phys_off - elink->emesh_start + size <= elink->emesh_size) {
		vma->vm_flags |= VM_IO;
		epiphany_vm_open(vma);
		return 0;
	}

	dev_dbg(&elink->dev,
		"elink_char_mmap: invalid request to map 0x%08lx, length 0x%08lx bytes\n",
		off, size);

	return -EINVAL;
}

static int elink_char_mmap(struct file *file, struct vm_area_struct *vma)
{
	struct elink_device *elink = file_to_elink(file);

	return _elink_char_mmap(elink, vma);
}

static int mesh_char_mmap(struct file *file, struct vm_area_struct *vma)
{
	struct mesh_device *mesh = file_to_mesh(file);
	struct array_device *array;
	struct elink_device *elink;

	array = mesh->arrays[0];
	if (!array)
		return -EINVAL;

	elink = array->connections[array->parent_side].elink;
	if (!elink)
		return -EINVAL;

	return _elink_char_mmap(elink, vma);
}

static long elink_char_ioctl_elink_get_mappings(struct elink_device *elink,
						unsigned long arg)
{
	struct e_mappings_info *info;
	struct e_mappings_info *dest = (struct e_mappings_info *) arg;
	struct mem_region *mapping;
	int ret = 0;

	info = kzalloc(sizeof(*info), GFP_KERNEL);
	if (!info)
		return -ENOMEM;

	list_for_each_entry(mapping, &elink->mappings_list, list) {
		info->mappings[info->nmappings].emesh_addr =
			mapping->emesh_start;
		info->mappings[info->nmappings].size = mapping->size;
		info->nmappings++;
	}

	ret = copy_to_user(dest, info, sizeof(*info));

	kfree(info);

	if (ret) {
		dev_dbg(&elink->dev, "elink get mappings ioctl failed.\n");
		return ret;
	}

	return 0;
}

static long elink_char_ioctl_elink_reset(struct elink_device *elink)
{
	int ret;

	if (epiphany_vm_freeze(true))
		return -ERESTARTSYS;

	if (epiphany.thermal_disallow) {
		ret = -EACCES;
		goto out;
	}

	ret = epiphany_reset();

out:
	epiphany_vm_unfreeze();
	return ret;
}

static long elink_char_ioctl_elink_probe(struct elink_device *elink,
					 unsigned long arg)
{
	struct e_elink_info info = {};
	struct e_elink_info *dest = (struct e_elink_info *) arg;
	struct connection *conn;
	int ret = 0, i;

	info.dev = elink->cdev.dev;
	info.version = elink->version.reg;
	info.connection_type = elink->connection.type;
	switch (elink->connection.type) {
	case E_CONN_DISCONNECTED:
		break;
	case E_CONN_ARRAY:
		info.array.id = elink->connection.array->id;
		info.array.chip_type = elink->connection.array->chip_type;
		info.array.chip_rows = elink->connection.array->chip_rows;
		info.array.chip_cols = elink->connection.array->chip_cols;
		info.array.parent_side = elink->connection.array->parent_side;
		info.array.mesh_dev = elink->connection.array->mesh->cdev.dev;

		for (i = 0; i < E_SIDE_MAX; i++) {
			conn = &elink->connection.array->connections[i];
			info.array.connections[i].type = conn->type;
			switch (conn->type) {
			case E_CONN_DISCONNECTED:
				break;
			case E_CONN_ELINK:
				info.array.connections[i].dev =
					conn->elink->cdev.dev;
				break;
			case E_CONN_ARRAY:
				info.array.connections[i].id =
					conn->array->id;
				break;
			default:
				/* TODO: Implement other types */
				WARN_ON(true);
				break;
			}
		}
		break;
	default:
		/* TODO: Implement other types */
		WARN_ON(true);
		break;
	}

	ret = copy_to_user(dest, &info, sizeof(info));
	if (ret) {
		dev_dbg(&elink->dev, "elink probe ioctl failed.\n");
		return ret;
	}

	return 0;
}

static long elink_char_ioctl_mailbox_read(struct file *file,
					  void __user *dst)
{
	int ret;
	struct e_mailbox_msg msg;
	struct elink_device *elink = file_to_elink(file);

	if (mutex_lock_interruptible(&epiphany.driver_lock))
		return -ERESTARTSYS;

	if (epiphany.thermal_disallow) {
		mutex_unlock(&epiphany.driver_lock);
		return -EACCES;
	}

	while (!atomic_read(&elink->mailbox_maybe_not_empty)
			|| elink_mailbox_empty_p(elink)) {
		atomic_set(&elink->mailbox_maybe_not_empty, 0);

		mutex_unlock(&epiphany.driver_lock);

		if (file->f_flags & O_NONBLOCK)
			return -EAGAIN;

		if (mutex_lock_interruptible(&epiphany.driver_lock))
			return -ERESTARTSYS;

		elink_mailbox_irq_enable(elink);

		mutex_unlock(&epiphany.driver_lock);

		ret = wait_event_interruptible_timeout(
				elink->mailbox_wait,
				atomic_read(&elink->mailbox_maybe_not_empty),
				msecs_to_jiffies(100));
		if (ret == -ERESTARTSYS)
			return -ERESTARTSYS;

		if (mutex_lock_interruptible(&epiphany.driver_lock))
			return -ERESTARTSYS;

		if (epiphany.thermal_disallow) {
			mutex_unlock(&epiphany.driver_lock);
			return -EACCES;
		}
	}

	msg.from = reg_read(elink->regs, ELINK_MAILBOXLO);
	msg.data = reg_read(elink->regs, ELINK_MAILBOXHI);

	mutex_unlock(&epiphany.driver_lock);

	if (copy_to_user(dst, &msg, sizeof(msg)))
		return -EACCES;

	return 0;
}

static long elink_char_ioctl_mailbox_count(struct file *file)
{
	long count;
	struct elink_device *elink = file_to_elink(file);

	if (mutex_lock_interruptible(&epiphany.driver_lock))
		return -ERESTARTSYS;

	if (epiphany.thermal_disallow) {
		mutex_unlock(&epiphany.driver_lock);
		return -EACCES;
	}

	count = elink_mailbox_count(elink);

	mutex_unlock(&epiphany.driver_lock);

	return count;
}

static long elink_char_ioctl_thermal_disallow(struct file *file)
{
	struct elink_device *elink;
	int ret = 0;

	if (epiphany_vm_freeze(true))
		return -ERESTARTSYS;

	if (epiphany.thermal_disallow)
		goto out;

	epiphany.thermal_disallow = true;

	/* Up refcount so it doesn't drop to 0 */
	epiphany.u_count++;

	list_for_each_entry(elink, &epiphany.elink_list, list)
		elink_disable(elink);

	list_for_each_entry(elink, &epiphany.elink_list, list)
		elink_regulator_disable(elink);

out:
	epiphany_vm_unfreeze();
	return ret;
}

static long elink_char_ioctl_thermal_allow(struct file *file)
{
	struct elink_device *elink;
	long ret = 0;

	if (epiphany_vm_freeze(true))
		return -ERESTARTSYS;

	if (!epiphany.thermal_disallow)
		goto out;

	epiphany.thermal_disallow = false;

	/* Restore refcount */
	epiphany.u_count--;

	list_for_each_entry(elink, &epiphany.elink_list, list)
		elink_regulator_enable(elink);

	ret = epiphany_reset();

out:
	epiphany_vm_unfreeze();
	return ret;
}

static long elink_char_ioctl(struct file *file, unsigned int cmd,
				unsigned long arg)
{
	struct elink_device *elink = file_to_elink(file);
	int err = 0;

	/* ??? TODO: Reset elink only instead of entire system ? */
	/* struct elink_device *elink = file_to_elink(file)->epiphany; */

	if (_IOC_TYPE(cmd) != E_IOCTL_MAGIC)
		return -ENOTTY;

	if (_IOC_NR(cmd) > E_IOCTL_MAXNR)
		return -ENOTTY;

	/* Do we really need to do this check?
	 * Isn't copy_to_user() already doing that? */
	if (_IOC_DIR(cmd) & _IOC_READ) {
		err =
		    !access_ok((void __user *)arg, _IOC_SIZE(cmd));
	} else if (_IOC_DIR(cmd) & _IOC_WRITE) {
		err =
		    !access_ok((void __user *)arg,
			       _IOC_SIZE(cmd));
	}

	if (err)
		return -EFAULT;

	switch (cmd) {
	case E_IOCTL_RESET:
		return elink_char_ioctl_elink_reset(elink);
	case E_IOCTL_ELINK_PROBE:
		return elink_char_ioctl_elink_probe(elink, arg);
	case E_IOCTL_GET_MAPPINGS:
		return elink_char_ioctl_elink_get_mappings(elink, arg);
	case E_IOCTL_MAILBOX_READ:
		return elink_char_ioctl_mailbox_read(file, (void __user *) arg);
	case E_IOCTL_MAILBOX_COUNT:
		return elink_char_ioctl_mailbox_count(file);
	case E_IOCTL_THERMAL_DISALLOW:
		return elink_char_ioctl_thermal_disallow(file);
	case E_IOCTL_THERMAL_ALLOW:
		return elink_char_ioctl_thermal_allow(file);

	default:
		return -ENOTTY;
	}

	return -ENOTTY;
}

/* TODO: Currently we only support meshes with one chip-array ... */
static long mesh_char_ioctl_probe(struct mesh_device *mesh, unsigned long arg)
{
	struct array_device *array;
	struct e_mesh_info *info;
	struct e_mesh_info *dest = (struct e_mesh_info *) arg;
	struct connection *conn;
	int ret, i;

	if (!mesh->arrays)
		return -ENODEV;

	array = mesh->arrays[0];
	if (!array)
		return -ENODEV;

	info = kzalloc(sizeof(*info), GFP_KERNEL);
	if (!info)
		return -ENOMEM;

	info->dev = mesh->cdev.dev;
	info->chip_type = array->chip_type;

	info->narrays = 1;
	info->arrays[0].id = array->id;
	info->arrays[0].chip_type = array->chip_type;
	info->arrays[0].chip_rows = array->chip_rows;
	info->arrays[0].chip_cols = array->chip_cols;
	info->arrays[0].parent_side = array->parent_side;
	info->arrays[0].mesh_dev = array->mesh->cdev.dev;

	for (i = 0; i < E_SIDE_MAX; i++) {
		conn = &array->connections[i];
		info->arrays[0].connections[i].type = conn->type;
		switch (conn->type) {
		case E_CONN_DISCONNECTED:
			break;
		case E_CONN_ELINK:
			info->arrays[0].connections[i].dev =
				conn->elink->cdev.dev;
			break;
		case E_CONN_ARRAY:
			info->arrays[0].connections[i].id =
				conn->array->id;
			break;
		default:
			/* TODO: Implement other types */
			WARN_ON(true);
			break;
		}
	}

	ret = copy_to_user(dest, info, sizeof(*info));

	kfree(info);

	if (ret) {
		dev_dbg(&mesh->dev, "mesh probe ioctl failed.\n");
		return ret;
	}

	return 0;
}

static long mesh_char_ioctl(struct file *file, unsigned int cmd,
				unsigned long arg)
{
	struct mesh_device *mesh = file_to_mesh(file);
	struct array_device *array;
	struct elink_device *elink;
	int err = 0;

	array = mesh->arrays[0];
	if (!array)
		return -EINVAL;

	elink = array->connections[array->parent_side].elink;
	if (!elink)
		return -EINVAL;


	/* ??? TODO: Reset elink only instead of entire system ? */
	/* struct elink_device *elink = file_to_elink(file)->epiphany; */

	if (_IOC_TYPE(cmd) != E_IOCTL_MAGIC)
		return -ENOTTY;

	if (_IOC_NR(cmd) > E_IOCTL_MAXNR)
		return -ENOTTY;

	/* Do we really need to do this check?
	 * Isn't copy_to_user() already doing that? */
	if (_IOC_DIR(cmd) & _IOC_READ) {
		err =
		    !access_ok((void __user *)arg, _IOC_SIZE(cmd));
	} else if (_IOC_DIR(cmd) & _IOC_WRITE) {
		err =
		    !access_ok((void __user *)arg,
			       _IOC_SIZE(cmd));
	}

	if (err)
		return -EFAULT;

	switch (cmd) {
	case E_IOCTL_RESET:
		return elink_char_ioctl_elink_reset(elink);
	case E_IOCTL_MESH_PROBE:
		return mesh_char_ioctl_probe(mesh, arg);

	case E_IOCTL_GET_MAPPINGS:
		return elink_char_ioctl_elink_get_mappings(elink, arg);

	default:
		return -ENOTTY;
	}

	return -ENOTTY;
}

static int minor_get(void *ptr)
{
	int retval;

	idr_preload(GFP_KERNEL);
	spin_lock(&epiphany.minor_idr_lock);
	retval = idr_alloc(&epiphany.minor_idr, ptr, 0, E_DEV_NUM_MINORS,
			   GFP_NOWAIT);
	spin_unlock(&epiphany.minor_idr_lock);
	idr_preload_end();
	return retval;
}

static void minor_put(int minor)
{
	spin_lock(&epiphany.minor_idr_lock);
	idr_remove(&epiphany.minor_idr, minor);
	spin_unlock(&epiphany.minor_idr_lock);
}

static const struct file_operations elink_char_driver_ops = {
	.owner		= THIS_MODULE,
	.open		= char_open,
	.release	= char_release,
	.mmap		= elink_char_mmap,
	.unlocked_ioctl	= elink_char_ioctl
};

static const struct file_operations mesh_char_driver_ops = {
	.owner		= THIS_MODULE,
	.open		= mesh_char_open,
	.release	= char_release,
	.mmap		= elink_char_mmap,
	.unlocked_ioctl	= elink_char_ioctl
};

static void mesh_device_release(struct device *dev)
{
	struct mesh_device *mesh = device_to_mesh(dev);

	dev_dbg(dev, "release\n");
	kfree(mesh->arrays);
	kfree(mesh);
}

/* TODO: Idea here is that we should try attach array to an existing mesh if
 * possible. Otherwise create a new mesh. Now we just create a new mesh for
 * each chip array. */
static int mesh_attach_or_register(struct array_device *array)
{
	struct mesh_device *mesh;
	int ret;
	dev_t devt;

	mesh = kzalloc(sizeof(*mesh), GFP_KERNEL);
	if (!mesh)
		return -ENOMEM;

	mesh->arrays = kcalloc(1 + 1, sizeof(*(mesh->arrays)), GFP_KERNEL);
	if (!mesh->arrays) {
		kfree(mesh);
		return -ENOMEM;
	}

	mesh->arrays[0] = array;

	ret = minor_get(mesh);
	if (ret < 0)
		goto err_minor;

	mesh->minor = ret;
	devt = MKDEV(MAJOR(epiphany.devt), mesh->minor);
	cdev_init(&mesh->cdev, &mesh_char_driver_ops);
	mesh->cdev.owner = THIS_MODULE;

	ret = cdev_add(&mesh->cdev, devt, 1);
	if (ret) {
		dev_err(&array->dev,
			"CHAR registration failed for mesh device\n");
		goto err_cdev_add;
	}

	mesh->dev.class = &epiphany.class;
	mesh->dev.parent = NULL;
	mesh->dev.devt = devt;
	mesh->dev.groups = NULL;
	mesh->dev.release = mesh_device_release;
	/* TODO: Use separate counter per char dev type */
	dev_set_name(&mesh->dev, "mesh%d",
		     atomic_inc_return(&epiphany.mesh_counter) - 1);

	ret = device_register(&mesh->dev);
	if (ret) {
		dev_err(&array->dev, "unable to create mesh device\n");
		goto err_dev_create;
	}

	mutex_lock(&epiphany.driver_lock);
	array->mesh = mesh;
	list_add_tail(&mesh->list, &epiphany.mesh_list);
	mutex_unlock(&epiphany.driver_lock);

	dev_dbg(&mesh->dev, "mesh_attach_or_register: registered char device\n");
	return 0;

err_dev_create:
	cdev_del(&mesh->cdev);
err_cdev_add:
	minor_put(mesh->minor);
err_minor:
	kfree(mesh->arrays);
	kfree(mesh);

	return ret;
}

void mesh_unregister(struct mesh_device *mesh)
{
	struct array_device **array;

	mutex_lock(&epiphany.driver_lock);
	for (array = &mesh->arrays[0]; *array; array++)
		(*array)->mesh = NULL;
	list_del(&mesh->list);
	mutex_unlock(&epiphany.driver_lock);

	cdev_del(&mesh->cdev);

	device_unregister(&mesh->dev);

	minor_put(mesh->minor);
}


/* Place holder */
static const struct attribute_group *dev_attr_groups_array[] = {
	NULL
};

static int array_register(struct array_device *array,
			  struct elink_device *elink)
{
	int ret;

	array->chip_type = elink->chip_type;

	array->connections[array->parent_side].type = E_CONN_ELINK;
	array->connections[array->parent_side].elink = elink;

	array->dev.class = &epiphany.class;
	array->dev.parent = &elink->dev;
	array->dev.groups = dev_attr_groups_array;
	dev_set_name(&array->dev, "array%d",
		     atomic_inc_return(&epiphany.array_counter) - 1);

	ret = device_register(&array->dev);
	if (ret) {
		dev_err(&array->dev, "unable to create device array device\n");
		goto err_dev_create;
	}

	/* There can only be one array per elink, no name conflicts */
	ret = sysfs_create_link(&elink->dev.kobj, &array->dev.kobj, "array");
	if (ret)
		dev_info(&array->dev, "arrays: failed creating symlink\n");

	mutex_lock(&epiphany.driver_lock);
	/* TODO: roll back if elink is not disconnected */
	WARN_ON(elink->connection.type != E_CONN_DISCONNECTED);
	if (elink->coreid_is_noop && array->id != 0x808) {
		dev_warn(&array->dev,
			 "arrays: non default id and elink coreid is no-op\n");
	}

	if (elink->coreid_pinout == -1) {
		dev_dbg(&array->dev,
			"arrays: setting elink coreid to array id 0x%03x\n",
			array->id);
		elink->coreid_pinout = array->id;
	}
	elink->connection.type = E_CONN_ARRAY;
	elink->connection.array = array;
	elink->connection.side = array->parent_side;
	list_add_tail(&array->list, &epiphany.chip_array_list);
	mutex_unlock(&epiphany.driver_lock);

	ret = mesh_attach_or_register(array);
	if (ret) {
		dev_info(&array->dev,
			 "array_register: could not attach to any mesh\n");
	}

	dev_dbg(&array->dev, "array_register: registered device\n");
	return 0;

err_dev_create:
	return ret;
}

static void array_unregister(struct array_device *array)
{
	struct elink_device *elink = device_to_elink(array->dev.parent);
	struct array_device **arrcurr, **arrprev;

	WARN_ON(!elink);

	if (elink)
		sysfs_remove_link(&elink->dev.kobj, "array");

	mutex_lock(&epiphany.driver_lock);
	list_del(&array->list);
	if (elink) {
		elink->connection.type = E_CONN_DISCONNECTED;
		elink->connection.array = NULL;
	}
	if (array->mesh) {
		/* Delete this array from list */
		arrprev = NULL;
		for (arrcurr = &array->mesh->arrays[0]; *arrcurr; arrcurr++) {
			if (!arrprev) {
				if (*arrcurr == array)
					*arrcurr = NULL;
					arrprev = arrcurr;
			} else {
				*arrprev = *arrcurr;
				arrprev++;
			}
		}
	}
	array->mesh = NULL;
	mutex_unlock(&epiphany.driver_lock);

	device_unregister(&array->dev);
}

static struct array_device *array_of_probe(struct platform_device *pdev)
{
	struct platform_device *ppdev =
		to_platform_device(pdev->dev.parent);
	struct elink_device *elink;
	struct array_device *array;
	enum e_link_side side;
	u32 reg[4];
	int ret;

	elink = platform_get_drvdata(ppdev);
	if (!elink) {
		/* This is a bug. array device should never be instantiated
		 * unless parent elink probe did succeed. */
		WARN_ON(true);
		dev_err(&pdev->dev, "No parent elink\n");
		return ERR_PTR(-ENXIO);
	}

	array = devm_kzalloc(&pdev->dev, sizeof(*array), GFP_KERNEL);
	if (!array)
		return ERR_PTR(-ENOMEM);

	array->phandle = pdev->dev.of_node->phandle;

	/* There is probably a better way for doing this */
	ret = of_property_read_u32_array(pdev->dev.of_node, "reg", reg, 4);
	if (ret) {
		dev_err(&pdev->dev, "arrays: invalid reg property\n");
		return ERR_PTR(ret);
	}

	array->id = (u16) reg[0];
	side = reg[1];
	array->chip_rows = reg[2];
	array->chip_cols = reg[3];

	switch (side) {
	case E_SIDE_N ... E_SIDE_W:
		array->parent_side = side;
		break;

	default:
		dev_err(&pdev->dev, "Invalid side %u\n", (u32) side);
		return ERR_PTR(-EINVAL);
	}

	ret = array_register(array, elink);
	if (ret)
		return ERR_PTR(ret);

	dev_dbg(&pdev->dev, "arrays: added connection\n");
	return array;
}

static int array_platform_probe(struct platform_device *pdev)
{
	struct array_device *array;
	int ret;

	array = devm_kzalloc(&pdev->dev, sizeof(*array), GFP_KERNEL);
	if (!array)
		return -ENOMEM;

	array = array_of_probe(pdev);
	if (IS_ERR(array)) {
		ret = PTR_ERR(array);
		if (ret == -EPROBE_DEFER)
			dev_info(&pdev->dev, "Deferring probe.\n");
		else
			dev_warn(&pdev->dev, "Failed parsing device tree\n");

		return ret;
	}

	platform_set_drvdata(pdev, array);

	return 0;
}

static int array_platform_remove(struct platform_device *pdev)
{
	struct array_device *array = platform_get_drvdata(pdev);

	array_unregister(array);

	dev_dbg(&pdev->dev, "device removed\n");

	return 0;
}

static const struct of_device_id array_of_match[] = {
	{ .compatible = "adapteva,chip-array" },
	{ }
};
MODULE_DEVICE_TABLE(of, array_of_match);

static struct platform_driver array_driver = {
	.probe	= array_platform_probe,
	.remove	= array_platform_remove,
	.driver	= {
		.name		= "array",
		.of_match_table	= of_match_ptr(array_of_match)
	}
};

ssize_t elink_attr_vdd_current_show(struct device *dev,
				    struct device_attribute *attr, char *buf)
{
	int ret = 0, vdd_curr;
	struct elink_device *elink = device_to_elink(dev);

	if (mutex_lock_interruptible(&epiphany.driver_lock))
		return -ERESTARTSYS;

	if (!elink->supply) {
		ret = -ENODEV;
		goto out;
	}

	vdd_curr = regulator_get_voltage(elink->supply);
	if (vdd_curr < 0) {
		ret = vdd_curr;
		goto out;
	}

	ret = sprintf(buf, "%d\n", vdd_curr);

out:
	mutex_unlock(&epiphany.driver_lock);
	return ret;
}

ssize_t elink_attr_vdd_wanted_show(struct device *dev,
				   struct device_attribute *attr, char *buf)
{
	int ret = 0;
	struct elink_device *elink = device_to_elink(dev);

	if (mutex_lock_interruptible(&epiphany.driver_lock))
		return -ERESTARTSYS;

	if (!elink->supply) {
		ret = -ENODEV;
		goto out;
	}

	ret = sprintf(buf, "%d\n", elink->vdd_wanted);

out:
	mutex_unlock(&epiphany.driver_lock);
	return ret;
}

/* Must hold driver lock before calling this function */
static int _elink_attr_vdd_wanted_store(struct elink_device *elink, int vdd)
{
	unsigned int step;
	const struct epiphany_chip_info *cinfo =
		&epiphany_chip_info[elink->chip_type];

	if (!elink->supply)
		return -ENODEV;

	/* Zero or below resets to default vdd */
	if (vdd <= 0) {
		elink->vdd_wanted = -1;
		return 0;
	}

	/* Round vdd down to closest step */
	step = regulator_get_linear_step(elink->supply);
	vdd = vdd - vdd % step;

	if (vdd < cinfo->vdd_min || cinfo->vdd_max < vdd)
		return -ERANGE;

	elink->vdd_wanted = vdd;

	return 0;
}

static ssize_t elink_attr_vdd_wanted_store(struct device *dev,
					   struct device_attribute *attr,
					   const char *buf,
					   size_t len)
{
	struct elink_device *elink = device_to_elink(dev);
	int ret, data;

	ret = kstrtoint(buf, 10, &data);
	if (ret < 0)
		return ret;

	if (mutex_lock_interruptible(&epiphany.driver_lock))
		return -ERESTARTSYS;

	ret = _elink_attr_vdd_wanted_store(elink, data);
	if (!ret)
		ret = len;

	mutex_unlock(&epiphany.driver_lock);
	return ret;
}

#define DEVICE_ATTR_PFX(_pfx, _name, _mode, _show, _store) \
	struct device_attribute dev_attr_##_pfx##_##_name = \
		__ATTR(_name, _mode, _show, _store)

static DEVICE_ATTR_PFX(elink, vdd_current, 0444, elink_attr_vdd_current_show,
		       NULL);
static DEVICE_ATTR_PFX(elink, vdd_wanted, 0644, elink_attr_vdd_wanted_show,
		       elink_attr_vdd_wanted_store);

static struct attribute *dev_attrs_elink[] = {
	&dev_attr_elink_vdd_current.attr,
	&dev_attr_elink_vdd_wanted.attr,
	NULL
};

static struct attribute_group dev_attr_group_elink = {
	.attrs = dev_attrs_elink
};



/* Place holder */
static const struct attribute_group *dev_attr_groups_elink[] = {
	&dev_attr_group_elink,
	NULL
};

static int elink_clks_get(struct elink_device *elink)
{
	int ret, i;

	/* We might not need clocks for e.g., PCI. Error should have been
	 * raised in probe */
	if (!elink->clocks)
		return 0;

	for (i = 0; elink->clocks[i]; i++) {
		ret = clk_prepare_enable(elink->clocks[i]);
		if (ret)
			goto err;
	}

	return 0;

err:
	dev_err(&elink->dev, "elink_clks_get: failed clk=%d, err=%d\n", i, ret);

	for (i--; i >= 0; i--)
		clk_disable_unprepare(elink->clocks[i]);

	return ret;
}

static void elink_clks_put(struct elink_device *elink)
{
	int i;

	if (!elink->clocks)
		return;

	/* Release in opposite order (not that it really matters atm). */

	for (i = 0; elink->clocks[i]; i++)
		;

	for (i--; i >= 0; i--)
		clk_disable_unprepare(elink->clocks[i]);
}

static int elink_probe(struct elink_device *elink)
{
	union elink_version version;
	int ret = 0;

	/* We must use epiphany_get() / epiphany_put() here so that a release
	 * of another device (mesh/elink) doesn't drop epiphany.u_count to
	 * zero. However, since this elink is yet to be added to
	 * epiphany.elink_list at this stage, we must also explicitly
	 * enable/disable its power regulator. (The FPGA elink usually gets
	 * clock from the chip it's connected to) */

	epiphany_get();

	elink->chip_type = E_CHIP_UNKNOWN;
	if (elink_regulator_enable(elink)) {
		ret = -EIO;
		goto err_regulator;
	}

	elink_reset(elink);

	version.reg = reg_read(elink->regs, ELINK_VERSION);
	/* HACK: This is 0 in current FPGA elink, guess default.*/
	if (!version.reg) {
		dev_warn(&elink->dev,
			 "elink: version field empty. Using default platform.\n");
		version.platform = E_PLATF_E16_7Z020_GPIO;
	}

	if (!version.platform || version.platform >= E_PLATF_MAX) {
		dev_err(&elink->dev, "elink: unsupported platform: 0x%x.\n",
			version.platform);
		ret = -EINVAL;
		goto err_platform;
	}

	if (elink->coreid_is_noop)
		elink->coreid_pinout = reg_read(elink->regs, ELINK_CHIPID);

	elink->version = version;
	elink->chip_type = elink_platform_chip_match[version.platform];

	dev_info(&elink->dev, "Epiphany FPGA elink at address %pa\n",
		 &elink->regs_start);
	dev_info(&elink->dev, "platform %02x revision %02x\n",
		 version.platform,
		 version.revision);

err_platform:
	elink_regulator_disable(elink);
err_regulator:
	epiphany_put();

	return ret;
}

static int elink_register(struct elink_device *elink)
{
	int ret;
	dev_t devt;

	elink->vdd_wanted = -1;

	ret = elink_clks_get(elink);
	if (ret)
		goto err_clks;

	ret = minor_get(elink);
	if (ret < 0)
		goto err_minor;

	elink->minor = ret;
	devt = MKDEV(MAJOR(epiphany.devt), elink->minor);
	cdev_init(&elink->cdev, &elink_char_driver_ops);
	elink->cdev.owner = THIS_MODULE;

	init_waitqueue_head(&elink->mailbox_wait);
	atomic_set(&elink->mailbox_maybe_not_empty, 1);
	INIT_WORK(&elink->mailbox_irq_work, elink_mailbox_irq_handler_bh);

	ret = cdev_add(&elink->cdev, devt, 1);
	if (ret) {
		dev_err(&elink->dev,
			"CHAR registration failed for elink driver\n");
		goto err_cdev_add;
	}

	elink->dev.class = &epiphany.class;
	elink->dev.parent = NULL;
	elink->dev.devt = devt;
	elink->dev.groups = dev_attr_groups_elink;
	dev_set_name(&elink->dev, "elink%d",
		     atomic_inc_return(&epiphany.elink_counter) - 1);

	ret = elink_probe(elink);
	if (ret) {
		dev_err(&elink->dev, "probing failed\n");
		goto err_probe;
	}

	ret = device_register(&elink->dev);
	if (ret) {
		dev_err(&elink->dev, "unable to create elink device\n");
		goto err_dev_create;
	}

	mutex_lock(&epiphany.driver_lock);
	list_add_tail(&elink->list, &epiphany.elink_list);
	mutex_unlock(&epiphany.driver_lock);

	/* Increase reference count if power management should be disabled */
	if (epiphany.param_nopm) {
		ret = epiphany_get();
		if (ret)
			goto err_epiphany_get;
	}


	dev_dbg(&elink->dev, "elink_register: registered char device\n");
	return 0;

err_epiphany_get:
err_dev_create:
	cdev_del(&elink->cdev);
err_probe:
err_cdev_add:
	minor_put(elink->minor);
err_minor:
	elink_clks_put(elink);
err_clks:
	return ret;
}

void elink_unregister(struct elink_device *elink)
{
	struct list_head *curr, *next;

	/* Decrease reference count to zero if power management is disabled */
	if (epiphany.param_nopm)
		epiphany_put();

	mutex_lock(&epiphany.driver_lock);
	list_del(&elink->list);
	mutex_unlock(&epiphany.driver_lock);

	cdev_del(&elink->cdev);

	device_unregister(&elink->dev);

	minor_put(elink->minor);

	elink_clks_put(elink);

	list_for_each_safe(curr, next, &elink->mem_region_list)
		list_del(curr);

	list_for_each_safe(curr, next, &elink->mappings_list)
		list_del(curr);

	/* Everything else is allocated with devm_* */
}

static int elink_of_probe_default_mappings(struct platform_device *pdev,
					   struct elink_device *elink)
{
	struct property *prop;
	u32 emesh_start, phys_start, size;
	const __be32 *p = NULL;
	struct mem_region *region, *mapping;
	int i;

	prop = of_find_property(pdev->dev.of_node, "adapteva,mmu", &i);
	if (!prop) {
		dev_dbg(&pdev->dev, "adapteva,mmu property is missing\n");
		return 0;
	}

	i /= sizeof(u32);

	if (i == 0 || i % 3) {
		dev_err(&pdev->dev, "adapteva,mmu property is invalid\n");
		return -EINVAL;
	}

	i /= 3;


	for (; i > 0; i--) {
		p = of_prop_next_u32(prop, p, &emesh_start);
		if (!p)
			return -EINVAL;
		p = of_prop_next_u32(prop, p, &phys_start);
		if (!p)
			return -EINVAL;
		p = of_prop_next_u32(prop, p, &size);
		if (!p)
			return -EINVAL;

		list_for_each_entry(region, &elink->mem_region_list, list) {
			if (region->start > phys_start ||
			    phys_start - region->start + size > region->size)
				continue;
			mapping = devm_kzalloc(&pdev->dev, sizeof(*mapping),
					       GFP_KERNEL);

			mapping->size = size;
			mapping->start = phys_start;
			mapping->emesh_start = emesh_start;

			list_add_tail(&mapping->list, &elink->mappings_list);
			dev_dbg(&pdev->dev,
				"added mapping: <0x%08x 0x%08x 0x%08x>\n",
				emesh_start, phys_start, size);

			break;
		}
	}
	return 0;
}

static int elink_of_probe_reserved_mem(struct platform_device *pdev,
				       struct elink_device *elink)
{
	struct device *dev = &pdev->dev;
	struct device_node *mem_node;
	struct mem_region *mem_region;
	struct resource res;
	int ret = 0;

	/* TODO: Only one memory region supported for now */
	mem_node = of_parse_phandle(dev->of_node, "memory-region", 0);
	if (!mem_node) {
		/* TODO: When elink firmware has mmu we should accept no
		 * memory region and downgrade to a warning. */
		dev_err(dev, "reserved-mem: no memory-region\n");
		return -ENODEV;
	}

	ret = of_address_to_resource(mem_node, 0, &res);
	if (ret) {
		dev_warn(dev, "reserved-mem: no resource\n");
		goto out;
	}

	if (!devm_request_mem_region(dev, res.start, resource_size(&res),
				     pdev->name)) {
		dev_warn(dev, "reserved-mem: failed requesting mem region\n");
		ret = -ENOMEM;
		goto out;
	}

	mem_region = devm_kzalloc(dev, sizeof(*mem_region), GFP_KERNEL);
	if (!mem_region) {
		ret = -ENOMEM;
		goto out;
	}

	mem_region->phandle = mem_node->phandle;
	mem_region->start = res.start;
	mem_region->size = resource_size(&res);

	list_add_tail(&mem_region->list, &elink->mem_region_list);
	dev_dbg(dev, "reserved-mem: added mem region at 0x%x\n", res.start);

out:
	of_node_put(mem_node);
	return ret;
}

static int elink_of_probe_clks(struct platform_device *pdev,
			       struct elink_device *elink)
{
	int ret = 0, i = 0;

	static const char const *names[] = {
		"fclk0", "fclk1", "fclk2", "fclk3"
	};

	elink->clocks = devm_kcalloc(&pdev->dev, ARRAY_SIZE(names) + 1,
				     sizeof(struct clock *), GFP_KERNEL);
	if (!elink->clocks)
		return -ENOMEM;

	for (i = 0; i < ARRAY_SIZE(names); i++) {
		elink->clocks[i] = devm_clk_get(&pdev->dev, names[i]);
		if (IS_ERR(elink->clocks[i])) {
			ret = PTR_ERR(elink->clocks[i]);
			goto err;
		}

		dev_dbg(&pdev->dev, "Added clock: %s\n", names[i]);
	}

	return 0;

err:
	for (i--; i >= 0; i--)
		devm_clk_put(&pdev->dev, elink->clocks[i]);

	devm_kfree(&pdev->dev, elink->clocks);
	elink->clocks = NULL;

	return ret;
}

static int elink_of_probe_supplies(struct platform_device *pdev,
				   struct elink_device *elink)
{
	int ret = 0;
	struct regulator *supply;
	struct device_node *supply_node;

	/* TODO: Support more than one regulator per elink */
	supply_node = of_parse_phandle(pdev->dev.of_node, "vdd-supply", 0);
	if (!supply_node) {
		dev_warn(&pdev->dev,
			 "elink: no supply node specified, no power management.\n");
		return 0;
	}
	of_node_put(supply_node);

	supply = devm_regulator_get_optional(&pdev->dev, "vdd");
	if (IS_ERR(supply)) {
		ret = PTR_ERR(supply);
		if (ret == -EPROBE_DEFER) {
			dev_info(&pdev->dev,
				 "elink: vdd regulator not ready, retry\n");
		} else {
			dev_info(&pdev->dev, "elink: no regulator: vdd: %d\n",
				 ret);
		}
		supply = NULL;
	}

	elink->supply = supply;
	return ret;
}

static struct elink_device *elink_of_probe(struct platform_device *pdev)
{
	struct elink_device *elink;
	struct property *prop;
	struct resource res;
	u16 coreid;
	int ret, irq;

	elink = devm_kzalloc(&pdev->dev, sizeof(*elink), GFP_KERNEL);
	if (!elink)
		return ERR_PTR(-ENOMEM);

	INIT_LIST_HEAD(&elink->mem_region_list);
	INIT_LIST_HEAD(&elink->mappings_list);

	elink->phandle = pdev->dev.of_node->phandle;
	elink->coreid_pinout = -1;

	/* Control regs */
	ret = of_address_to_resource(pdev->dev.of_node, 0, &res);
	if (ret) {
		dev_err(&pdev->dev, "no control reg resource\n");
		return ERR_PTR(ret);
	}
	elink->regs_start = res.start;
	elink->regs_size = resource_size(&res);

	/* Host bus slave address range for emesh */
	ret = of_address_to_resource(pdev->dev.of_node, 1, &res);
	if (ret) {
		dev_err(&pdev->dev, "no bus resource\n");
		return ERR_PTR(ret);
	}
	elink->emesh_start = res.start;
	elink->emesh_size = resource_size(&res);


	/* don't accept regs overlapping mesh region */
	if (elink->regs_start < elink->emesh_start &&
	    elink->emesh_start < elink->regs_start + elink->regs_size) {
		dev_err(&pdev->dev,
			"elink regs overlapping emesh memory region\n");
			return ERR_PTR(-EINVAL);
	}

	/* accept regs fully inside mesh region */
	if (elink->regs_start + elink->regs_size <= elink->emesh_start ||
	    elink->emesh_start + elink->emesh_size <= elink->regs_start) {
		if (!devm_request_mem_region(&pdev->dev, elink->regs_start,
					     elink->regs_size, pdev->name)) {
			dev_err(&pdev->dev,
				"failed requesting control reg mem region\n");
			return ERR_PTR(-ENOMEM);
		}
	}

	if (!devm_request_mem_region(&pdev->dev, elink->emesh_start,
				     elink->emesh_size, pdev->name)) {
		dev_err(&pdev->dev, "failed requesting emesh mem region\n");
		return ERR_PTR(-ENOMEM);
	}

	elink->regs = devm_ioremap_nocache(&pdev->dev, elink->regs_start,
					   elink->regs_size);
	if (!elink->regs) {
		dev_err(&pdev->dev, "Mapping eLink registers failed.\n");
		return ERR_PTR(-ENOMEM);
	}

	/* Power regulators */
	ret = elink_of_probe_supplies(pdev, elink);
	if (ret) {
		dev_err(&pdev->dev, "Could not get power supplies\n");
		return ERR_PTR(ret);
	}

	/* Clocks */
	ret = elink_of_probe_clks(pdev, elink);
	if (ret) {
		dev_err(&pdev->dev, "Could not get clocks\n");
		return ERR_PTR(ret);
	}

	/* Mailbox interrupt */
	irq = platform_get_irq(pdev, 0);
	if (irq < 0) {
		dev_err(&pdev->dev, "Could not get mailbox IRQ from platform data\n");
		return ERR_PTR(irq);
	}

	ret = devm_request_irq(&pdev->dev, irq, elink_mailbox_irq_handler, 0,
			dev_name(&pdev->dev), elink);
	if (ret) {
		dev_err(&pdev->dev, "Could not request mailbox IRQ\n");
		return ERR_PTR(ret);
	}

	/* Chip-id pinout */
	prop = of_find_property(pdev->dev.of_node,
				"adapteva,no-coreid-pinout", NULL);
	if (prop) {
		elink->coreid_is_noop = true;
		dev_dbg(&pdev->dev, "coreid is no-op\n");
	}


	/* Manually override coreid pinout. Set by array probe otherwise */
	ret = of_property_read_u16(pdev->dev.of_node, "adapteva,coreid",
				   &coreid);
	if (!ret) {
		elink->coreid_pinout = (s16) coreid;
	} else if (ret == -EINVAL) {
		elink->coreid_pinout = -1;
	} else {
		dev_err(&pdev->dev, "Malformed coreid pinout dt property\n");
		return ERR_PTR(ret);
	}

	ret = elink_of_probe_reserved_mem(pdev, elink);
	if (ret) {
		dev_err(&pdev->dev, "reserved mem probe failed\n");
		return ERR_PTR(ret);
	}

	ret = elink_of_probe_default_mappings(pdev, elink);
	if (ret) {
		dev_err(&pdev->dev, "failed probing default mappings\n");
		return ERR_PTR(ret);
	}

	ret = elink_register(elink);
	if (ret) {
		dev_err(&pdev->dev, "failed to register elink: %d\n", ret);
		return ERR_PTR(ret);
	}

	return elink;
}

static int elink_platform_probe(struct platform_device *pdev)
{
	struct elink_device *elink;
	int ret;

	elink = elink_of_probe(pdev);
	if (IS_ERR(elink)) {
		ret = PTR_ERR(elink);
		if (ret == -EPROBE_DEFER)
			dev_info(&pdev->dev, "Deferring probe.\n");
		else
			dev_warn(&pdev->dev, "Failed parsing device tree\n");

		return ret;
	}

	platform_set_drvdata(pdev, elink);

	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
	if (ret) {
		dev_err(&pdev->dev, "Failed to create DT children: %d\n", ret);
		return ret;
	}

	return 0;
}

static int elink_platform_remove(struct platform_device *pdev)
{
	struct elink_device *elink = platform_get_drvdata(pdev);

	if (elink->connection.type == E_CONN_ARRAY)
		array_unregister(elink->connection.array);

	of_platform_depopulate(&pdev->dev);

	elink_unregister(elink);

	dev_dbg(&pdev->dev, "device removed\n");

	return 0;
}

static const struct of_device_id elink_of_match[] = {
	{ .compatible = "adapteva,elink" },
	{ }
};
MODULE_DEVICE_TABLE(of, elink_of_match);

static struct platform_driver elink_driver = {
	.probe	= elink_platform_probe,
	.remove	= elink_platform_remove,
	.driver	= {
		.name		= "elink",
		.of_match_table	= of_match_ptr(elink_of_match)
	}
};

static char *epiphany_devnode(struct device *dev, umode_t *mode)
{
	return kasprintf(GFP_KERNEL, "epiphany/%s", dev_name(dev));
}

static void epiphany_device_release(struct device *dev)
{
	/* No-op since we use devm_* */
}

static void __init init_epiphany(void)
{
	epiphany.class.name = "epiphany";
	epiphany.class.owner = THIS_MODULE;
	epiphany.class.devnode = epiphany_devnode;
	epiphany.class.dev_release = epiphany_device_release;

	epiphany.u_count = 0;

	INIT_LIST_HEAD(&epiphany.elink_list);
	INIT_LIST_HEAD(&epiphany.chip_array_list);
	INIT_LIST_HEAD(&epiphany.mesh_list);

	INIT_LIST_HEAD(&epiphany.vma_list);

	epiphany.thermal_disallow = false;

	idr_init(&epiphany.minor_idr);
	spin_lock_init(&epiphany.minor_idr_lock);


	atomic_set(&epiphany.elink_counter, 0);
	atomic_set(&epiphany.mesh_counter, 0);
	atomic_set(&epiphany.array_counter, 0);

	mutex_init(&epiphany.driver_lock);
}

static int __init epiphany_module_init(void)
{
	int ret;

	init_epiphany();

	ret = class_register(&epiphany.class);
	if (ret) {
		pr_err("Unable to register epiphany class\n");
		goto err_class;
	}

	ret = alloc_chrdev_region(&epiphany.devt, 0, E_DEV_NUM_MINORS,
				  "epiphany");
	if (ret) {
		pr_err("Failed allocating epiphany major number: %i\n", ret);
		goto err_chrdev;
	}
	pr_devel("epiphany device allocated, major %i\n", MAJOR(epiphany.devt));

	ret = platform_driver_register(&elink_driver);
	if (ret) {
		pr_err("Failed to register elink platform driver\n");
		goto err_register_elink;
	}

	ret = platform_driver_register(&array_driver);
	if (ret) {
		pr_err("Failed to register elink platform driver\n");
		goto err_register_array;
	}

	return 0;

err_register_array:
	platform_driver_unregister(&elink_driver);
err_register_elink:
	unregister_chrdev_region(epiphany.devt, E_DEV_NUM_MINORS);
err_chrdev:
	class_unregister(&epiphany.class);
err_class:
	return ret;
}
module_init(epiphany_module_init);

static void __exit epiphany_module_exit(void)
{
	struct mesh_device *curr, *next;

	if (epiphany.thermal_disallow) {
		epiphany.thermal_disallow = false;
		/* Fix refcount, elinks + regulators already disabled */
		epiphany.u_count--;
	}

	list_for_each_entry_safe(curr, next, &epiphany.mesh_list, list)
		mesh_unregister(curr);

	platform_driver_unregister(&array_driver);
	platform_driver_unregister(&elink_driver);
	unregister_chrdev_region(epiphany.devt, E_DEV_NUM_MINORS);
	class_unregister(&epiphany.class);

	WARN_ON(!list_empty(&epiphany.chip_array_list));
	WARN_ON(!list_empty(&epiphany.elink_list));
	WARN_ON(!list_empty(&epiphany.mesh_list));
}
module_exit(epiphany_module_exit);

MODULE_DESCRIPTION("Adapteva Epiphany driver");
MODULE_VERSION("0.1");
MODULE_LICENSE("GPL");
