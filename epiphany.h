#ifndef __EPIPHANY_H__
#define __EPIPHANY_H__

#include <uapi/misc/epiphany.h>

/* Epiphany system registers */
enum e_elink_regs {
	ELINK_RESET		= 0xF0200,
	ELINK_CLK		= 0xF0204,
	ELINK_CHIPID		= 0xF0208,
	ELINK_VERSION		= 0xF020C,
	ELINK_TXCFG		= 0xF0210,
	ELINK_TXSTATUS		= 0xF0214,
	ELINK_TXGPIO		= 0xF0218,
	ELINK_TXMONITOR		= 0xF021C,
	ELINK_TXPACKET		= 0xF0220,
	ELINK_RXCFG		= 0xF0300,
	ELINK_RXSTATUS		= 0xF0304,
	ELINK_RXGPIO		= 0xF0308,
	ELINK_RXOFFSET		= 0xF030C,
	ELINK_RXDELAY0		= 0xF0310,
	ELINK_RXDELAY1		= 0xF0314,
	ELINK_RXTESTDATA	= 0xF0318,
	ELINK_MAILBOXLO		= 0xF0730,
	ELINK_MAILBOXHI		= 0xF0734,
	ELINK_MAILBOXSTAT	= 0xF0738,
	ELINK_TXMMU		= 0xE0000,
	ELINK_RXMMU		= 0xE8000,
};

union elink_reset {
	u32 reg;
	struct {
		unsigned tx_reset:1;
		unsigned rx_reset:1;
	};
} __packed;

union elink_chipid {
	u32 reg;
	union {
		struct {
			unsigned corecol:6;
			unsigned corerow:6;
		};
		struct {
			unsigned:2;
			unsigned chipcol;
			unsigned:2;
			unsigned chiprow;
		};
	};
} __packed;

union elink_version {
	u32 reg;
	struct {
		unsigned platform:8;
		unsigned revision:8;
	};
} __packed;

union elink_txcfg {
	u32 reg;
	struct {
		unsigned enable:1;
		unsigned mmu_enable:1;
		unsigned remap_mode:2;
		unsigned ctrlmode:4;
		unsigned:1;
		unsigned ctrlmode_bypass:1;
		unsigned burst_enable:1;
		unsigned transmit_mode:2;
	};
} __packed;

union elink_rxcfg {
	u32 reg;
	struct {
		unsigned test_mode:1;
		unsigned mmu_enable:1;
		unsigned remap_mode:2;
		unsigned remap_sel:12;
		unsigned remap_pattern:12;
		unsigned mailbox_irq_en:1;
	};
} __packed;

union elink_mailboxstat {
	u32 reg;
	struct {
		unsigned not_empty:1;
		unsigned full:1;
		unsigned half_full:1;
		unsigned:13;
		u16 count;
	};
} __packed;

/* Chip registers */
enum e_chip_regs {
	E_REG_LINKCFG		= 0xf0300,
	E_REG_LINKTXCFG		= 0xf0304,
	E_REG_LINKRXCFG		= 0xf0308,
	E_REG_GPIOCFG		= 0xf030c,
	E_REG_FLAGCFG		= 0xf0318,
	E_REG_SYNC		= 0xf031c,
	E_REG_HALT		= 0xf0320,
	E_REG_RESET		= 0xf0324,
	E_REG_LINKDEBUG		= 0xf0328
};

enum e_ctrlmode {
	E_CTRLMODE_NORMAL	= 0,
	E_CTRLMODE_DMA0_LAST	= 4,
	E_CTRLMODE_DMA1_LAST	= 8,
	E_CTRLMODE_MSGMODE	= 12,
	E_CTRLMODE_MULTICAST	= 3,
	E_CTRLMODE_NORTH	= 1,
	E_CTRLMODE_EAST		= 5,
	E_CTRLMODE_SOUTH	= 9,
	E_CTRLMODE_WEST		= 13
};

enum e_core_reg {
	E_REG_BASE		= 0xf0000,
	E_REG_CONFIG		= 0xf0400,
	E_REG_MESHCONFIG	= 0xf0700
};

#endif /* __EPIPHANY_H__ */
