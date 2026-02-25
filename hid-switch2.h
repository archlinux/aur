/* SPDX-License-Identifier: GPL-2.0+ */
/*
 * HID driver for Nintendo Switch controllers
 *
 * Copyright (c) 2025 Valve Software
 *
 * This driver is based on the following work:
 *   https://gist.github.com/shinyquagsire23/66f006b46c56216acbaac6c1e2279b64
 *   https://github.com/ndeadly/switch2_controller_research
 */

#include <linux/bits.h>
#include <linux/input.h>
#include <linux/mutex.h>
#include <linux/rcupdate.h>
#include <linux/spinlock.h>
#include "hid-ids.h"

#define NS2_FLAG_OK	BIT(0)
#define NS2_FLAG_NACK	BIT(2)

#define NS2_FLASH_ADDR_SERIAL			0x13002
#define NS2_FLASH_ADDR_FACTORY_PRIMARY_CALIB	0x130a8
#define NS2_FLASH_ADDR_FACTORY_SECONDARY_CALIB	0x130e8
#define NS2_FLASH_ADDR_FACTORY_TRIGGER_CALIB	0x13140
#define NS2_FLASH_ADDR_USER_PRIMARY_CALIB	0x1fc040
#define NS2_FLASH_ADDR_USER_SECONDARY_CALIB	0x1fc080

#define NS2_FLASH_SIZE_SERIAL 0x10
#define NS2_FLASH_SIZE_FACTORY_AXIS_CALIB 9
#define NS2_FLASH_SIZE_FACTORY_TRIGGER_CALIB 2
#define NS2_FLASH_SIZE_USER_AXIS_CALIB 11

#define NS2_USER_CALIB_MAGIC 0xa1b2

#define NS2_FEATURE_BUTTONS	BIT(0)
#define NS2_FEATURE_ANALOG	BIT(1)
#define NS2_FEATURE_IMU		BIT(2)
#define NS2_FEATURE_MOUSE	BIT(4)
#define NS2_FEATURE_RUMBLE	BIT(5)
#define NS2_FEATURE_MAGNETO	BIT(7)

enum switch2_cmd {
	NS2_CMD_NFC = 0x01,
	NS2_CMD_FLASH = 0x02,
	NS2_CMD_INIT = 0x03,
	NS2_CMD_GRIP = 0x08,
	NS2_CMD_LED = 0x09,
	NS2_CMD_VIBRATE = 0x0a,
	NS2_CMD_BATTERY = 0x0b,
	NS2_CMD_FEATSEL = 0x0c,
	NS2_CMD_FW_UPD = 0x0d,
	NS2_CMD_FW_INFO = 0x10,
	NS2_CMD_BT_PAIR = 0x15,
};

enum switch2_direction {
	NS2_DIR_IN = 0x00,
	NS2_DIR_OUT = 0x90,
};

enum switch2_transport {
	NS2_TRANS_USB = 0x00,
	NS2_TRANS_BT = 0x01,
};

enum switch2_subcmd_flash {
	NS2_SUBCMD_FLASH_READ_BLOCK = 0x01,
	NS2_SUBCMD_FLASH_WRITE_BLOCK = 0x02,
	NS2_SUBCMD_FLASH_ERASE_BLOCK = 0x03,
	NS2_SUBCMD_FLASH_READ = 0x04,
	NS2_SUBCMD_FLASH_WRITE = 0x05,
};

enum switch2_subcmd_init {
	NS2_SUBCMD_INIT_SELECT_REPORT = 0xa,
	NS2_SUBCMD_INIT_USB = 0xd,
};

enum switch2_subcmd_feature_select {
	NS2_SUBCMD_FEATSEL_GET_INFO = 0x1,
	NS2_SUBCMD_FEATSEL_SET_MASK = 0x2,
	NS2_SUBCMD_FEATSEL_CLEAR_MASK = 0x3,
	NS2_SUBCMD_FEATSEL_ENABLE = 0x4,
	NS2_SUBCMD_FEATSEL_DISABLE = 0x5,
};

enum switch2_subcmd_grip {
	NS2_SUBCMD_GRIP_GET_INFO = 0x1,
	NS2_SUBCMD_GRIP_ENABLE_BUTTONS = 0x2,
	NS2_SUBCMD_GRIP_GET_INFO_EXT = 0x3,
};

enum switch2_subcmd_led {
	NS2_SUBCMD_LED_P1 = 0x1,
	NS2_SUBCMD_LED_P2 = 0x2,
	NS2_SUBCMD_LED_P3 = 0x3,
	NS2_SUBCMD_LED_P4 = 0x4,
	NS2_SUBCMD_LED_ALL_ON = 0x5,
	NS2_SUBCMD_LED_ALL_OFF = 0x6,
	NS2_SUBCMD_LED_PATTERN = 0x7,
	NS2_SUBCMD_LED_BLINK = 0x8,
};

enum switch2_subcmd_fw_info {
	NS2_SUBCMD_FW_INFO_GET = 0x1,
};

enum switch2_ctlr_type {
	NS2_CTLR_TYPE_JCL = 0x00,
	NS2_CTLR_TYPE_JCR = 0x01,
	NS2_CTLR_TYPE_PRO = 0x02,
	NS2_CTLR_TYPE_GC = 0x03,
};

enum switch2_report_id {
	NS2_REPORT_UNIFIED = 0x05,
	NS2_REPORT_JCL = 0x07,
	NS2_REPORT_JCR = 0x08,
	NS2_REPORT_PRO = 0x09,
	NS2_REPORT_GC = 0x0a,
};

enum switch2_init_step {
	NS2_INIT_STARTING,
	NS2_INIT_READ_SERIAL,
	NS2_INIT_READ_FACTORY_PRIMARY_CALIB,
	NS2_INIT_READ_FACTORY_SECONDARY_CALIB,
	NS2_INIT_READ_FACTORY_TRIGGER_CALIB,
	NS2_INIT_READ_USER_PRIMARY_CALIB,
	NS2_INIT_READ_USER_SECONDARY_CALIB,
	NS2_INIT_SET_FEATURE_MASK,
	NS2_INIT_ENABLE_FEATURES,
	NS2_INIT_GET_FIRMWARE_INFO,
#ifdef CONFIG_SWITCH2_FF
	NS2_INIT_ENABLE_RUMBLE,
#endif
	NS2_INIT_GRIP_BUTTONS,
	NS2_INIT_SET_PLAYER_LEDS,
	NS2_INIT_INPUT,
	NS2_INIT_DONE,
};

struct switch2_cmd_header {
	uint8_t command;
	uint8_t direciton;
	uint8_t transport;
	uint8_t subcommand;
	uint8_t unk1;
	uint8_t length;
	uint16_t unk2;
};
static_assert(sizeof(struct switch2_cmd_header) == 8);

struct switch2_controller;
struct switch2_cfg_intf {
	struct switch2_controller *parent;

	int (*send_command)(enum switch2_cmd command, uint8_t subcommand,
		const void *message, size_t length,
		struct switch2_cfg_intf *intf);
};

struct switch2_version_info {
	uint8_t major;
	uint8_t minor;
	uint8_t patch;
	uint8_t ctlr_type;
	__le32 unk;
	int8_t dsp_major;
	int8_t dsp_minor;
	int8_t dsp_patch;
	int8_t dsp_type;
};

struct switch2_axis_calibration {
	uint16_t neutral;
	uint16_t negative;
	uint16_t positive;
};

struct switch2_stick_calibration {
	struct switch2_axis_calibration x;
	struct switch2_axis_calibration y;
};

struct switch2_hd_rumble {
	uint16_t hi_freq : 10;
	uint16_t hi_amp : 10;
	uint16_t lo_freq : 10;
	uint16_t lo_amp : 10;
} __packed;

struct switch2_erm_rumble {
	uint16_t error;
	uint16_t amplitude;
};

struct switch2_controller {
	struct hid_device *hdev;
	struct switch2_cfg_intf *cfg;

	char phys[64];
	struct list_head entry;
	struct mutex lock;

	enum switch2_ctlr_type ctlr_type;
	enum switch2_init_step init_step;
	struct input_dev __rcu *input;
	char serial[NS2_FLASH_SIZE_SERIAL + 1];
	struct switch2_version_info version;

	struct switch2_stick_calibration stick_calib[2];
	uint8_t lt_zero;
	uint8_t rt_zero;

	uint32_t player_id;

#ifdef CONFIG_SWITCH2_FF
	spinlock_t rumble_lock;
	uint8_t rumble_seq;
	union {
		struct switch2_hd_rumble hd;
		struct switch2_erm_rumble sd;
	} rumble;
	unsigned long last_rumble_work;
	struct delayed_work rumble_work;
#endif
};

struct switch2_controller *switch2_get_controller(const char *phys);
void switch2_controller_put(struct switch2_controller *controller);

int switch2_receive_command(struct switch2_controller *controller,
	const uint8_t *message, size_t length);

int switch2_init_controller(struct switch2_controller *controller);

static inline bool switch2_ctlr_is_joycon(enum switch2_ctlr_type type)
{
	return type == NS2_CTLR_TYPE_JCL || type == NS2_CTLR_TYPE_JCR;
}
