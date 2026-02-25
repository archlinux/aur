// SPDX-License-Identifier: GPL-2.0+
/*
 * HID driver for Nintendo Switch controllers
 *
 * Copyright (c) 2025 Valve Software
 *
 * This driver is based on the following work:
 *   https://gist.github.com/shinyquagsire23/66f006b46c56216acbaac6c1e2279b64
 *   https://github.com/ndeadly/switch2_controller_research
 *   hid-nintendo driver
 */

#include "hid-switch2.h"
#include <linux/device.h>
#include <linux/hid.h>
#include <linux/idr.h>
#include <linux/jiffies.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/usb.h>

/*
 * hid_to_usb_dev() is defined in drivers/hid/usbhid/usbhid.h which is
 * private to the usbhid driver and not available for out-of-tree modules.
 * Provide a local definition identical to the kernel's.
 */
static inline struct usb_device *hid_to_usb_dev(struct hid_device *hdev)
{
	return interface_to_usbdev(to_usb_interface(hdev->dev.parent));
}

#define NS2_BTNR_B	BIT(0)
#define NS2_BTNR_A	BIT(1)
#define NS2_BTNR_Y	BIT(2)
#define NS2_BTNR_X	BIT(3)
#define NS2_BTNR_R	BIT(4)
#define NS2_BTNR_ZR	BIT(5)
#define NS2_BTNR_PLUS	BIT(6)
#define NS2_BTNR_RS	BIT(7)

#define NS2_BTNL_DOWN	BIT(0)
#define NS2_BTNL_RIGHT	BIT(1)
#define NS2_BTNL_LEFT	BIT(2)
#define NS2_BTNL_UP	BIT(3)
#define NS2_BTNL_L	BIT(4)
#define NS2_BTNL_ZL	BIT(5)
#define NS2_BTNL_MINUS	BIT(6)
#define NS2_BTNL_LS	BIT(7)

#define NS2_BTN3_C	BIT(4)
#define NS2_BTN3_SR	BIT(6)
#define NS2_BTN3_SL	BIT(7)

#define NS2_BTN_JCR_HOME	BIT(0)
#define NS2_BTN_JCR_GR		BIT(2)
#define NS2_BTN_JCR_C		NS2_BTN3_C
#define NS2_BTN_JCR_SR		NS2_BTN3_SR
#define NS2_BTN_JCR_SL		NS2_BTN3_SL

#define NS2_BTN_JCL_CAPTURE	BIT(0)
#define NS2_BTN_JCL_GL		BIT(2)
#define NS2_BTN_JCL_SR		NS2_BTN3_SR
#define NS2_BTN_JCL_SL		NS2_BTN3_SL

#define NS2_BTN_PRO_HOME	BIT(0)
#define NS2_BTN_PRO_CAPTURE	BIT(1)
#define NS2_BTN_PRO_GR		BIT(2)
#define NS2_BTN_PRO_GL		BIT(3)
#define NS2_BTN_PRO_C		NS2_BTN3_C

#define NS2_BTN_GC_HOME		BIT(0)
#define NS2_BTN_GC_CAPTURE	BIT(1)
#define NS2_BTN_GC_C		NS2_BTN3_C

#define NS2_TRIGGER_RANGE	4095
#define NS2_AXIS_MIN		-32768
#define NS2_AXIS_MAX		32767

#define NS2_MAX_PLAYER_ID	8

enum gc_rumble {
	GC_RUMBLE_OFF = 0,
	GC_RUMBLE_ON = 1,
	GC_RUMBLE_STOP = 2,
};

/*
 * The highest rumble level for "HD Rumble" is strong enough to potentially damage the controller,
 * and also leaves your hands feeling like melted jelly, so we set a semi-abitrary scaling factor
 * to artificially limit the maximum for safety and comfort. It is currently unknown if the Switch
 * 2 itself does something similar, but it's quite likely.
 *
 * This value must be between 0 and 1024, otherwise the math below will overflow.
 */
#define RUMBLE_MAX 450u

/*
 * Semi-arbitrary values used to simulate the "rumble" sensation of an eccentric rotating
 * mass type haptic motor on the Switch 2 controllers' linear resonant actuator type haptics.
 *
 * The units used are unknown, but the values must be between 0 and 1023.
 */
#define RUMBLE_HI_FREQ 0x187
#define RUMBLE_LO_FREQ 0x112

static DEFINE_MUTEX(switch2_controllers_lock);
static LIST_HEAD(switch2_controllers);

struct switch2_ctlr_button_mapping {
	uint32_t code;
	int byte;
	uint32_t bit;
};

static const struct switch2_ctlr_button_mapping left_joycon_button_mappings[] = {
	{ BTN_TL,	0, NS2_BTNL_L,		},
	{ BTN_TL2,	0, NS2_BTNL_ZL,		},
	{ BTN_SELECT,	0, NS2_BTNL_MINUS,	},
	{ BTN_THUMBL,	0, NS2_BTNL_LS,		},
	{ BTN_GRIPL,	1, NS2_BTN_JCL_GL,	},
	{ KEY_RECORD,	1, NS2_BTN_JCL_CAPTURE,	},
	{ /* sentinel */ },
};

static const struct switch2_ctlr_button_mapping right_joycon_button_mappings[] = {
	{ BTN_SOUTH,	0, NS2_BTNR_A,		},
	{ BTN_EAST,	0, NS2_BTNR_B,		},
	{ BTN_NORTH,	0, NS2_BTNR_X,		},
	{ BTN_WEST,	0, NS2_BTNR_Y,		},
	{ BTN_TR,	0, NS2_BTNR_R,		},
	{ BTN_TR2,	0, NS2_BTNR_ZR,		},
	{ BTN_START,	0, NS2_BTNR_PLUS,	},
	{ BTN_THUMBR,	0, NS2_BTNR_RS,		},
	{ BTN_C,	1, NS2_BTN_JCR_C,	},
	{ BTN_GRIPR,	1, NS2_BTN_JCR_GR,	},
	{ BTN_MODE,	1, NS2_BTN_JCR_HOME,	},
	{ /* sentinel */ },
};

static const struct switch2_ctlr_button_mapping procon_mappings[] = {
	{ BTN_SOUTH,	0, NS2_BTNR_A,		},
	{ BTN_EAST,	0, NS2_BTNR_B,		},
	{ BTN_NORTH,	0, NS2_BTNR_X,		},
	{ BTN_WEST,	0, NS2_BTNR_Y,		},
	{ BTN_TL,	1, NS2_BTNL_L,		},
	{ BTN_TR,	0, NS2_BTNR_R,		},
	{ BTN_TL2,	1, NS2_BTNL_ZL,		},
	{ BTN_TR2,	0, NS2_BTNR_ZR,		},
	{ BTN_SELECT,	1, NS2_BTNL_MINUS,	},
	{ BTN_START,	0, NS2_BTNR_PLUS,	},
	{ BTN_THUMBL,	1, NS2_BTNL_LS,		},
	{ BTN_THUMBR,	0, NS2_BTNR_RS,		},
	{ BTN_MODE,	2, NS2_BTN_PRO_HOME	},
	{ KEY_RECORD,	2, NS2_BTN_PRO_CAPTURE	},
	{ BTN_GRIPR,	2, NS2_BTN_PRO_GR	},
	{ BTN_GRIPL,	2, NS2_BTN_PRO_GL	},
	{ BTN_C,	2, NS2_BTN_PRO_C	},
	{ /* sentinel */ },
};

static const struct switch2_ctlr_button_mapping gccon_mappings[] = {
	{ BTN_SOUTH,	0, NS2_BTNR_A,		},
	{ BTN_EAST,	0, NS2_BTNR_B,		},
	{ BTN_NORTH,	0, NS2_BTNR_X,		},
	{ BTN_WEST,	0, NS2_BTNR_Y,		},
	{ BTN_TL,	1, NS2_BTNL_L,		},
	{ BTN_TR,	0, NS2_BTNR_R,		},
	{ BTN_TL2,	1, NS2_BTNL_ZL,		},
	{ BTN_TR2,	0, NS2_BTNR_ZR,		},
	{ BTN_SELECT,	1, NS2_BTNL_MINUS,	},
	{ BTN_START,	0, NS2_BTNR_PLUS,	},
	{ BTN_MODE,	2, NS2_BTN_GC_HOME	},
	{ KEY_RECORD,	2, NS2_BTN_GC_CAPTURE	},
	{ BTN_C,	2, NS2_BTN_GC_C		},
	{ /* sentinel */ },
};

static const uint8_t switch2_init_cmd_data[] = {
	/*
	 * The last 6 bytes of this packet are the MAC address of
	 * the console, but we don't need that for USB
	 */
	0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
};

static const uint8_t switch2_one_data[] = { 0x01, 0x00, 0x00, 0x00 };
#ifdef CONFIG_SWITCH2_FF
static const uint8_t switch2_zero_data[] = { 0x00, 0x00, 0x00, 0x00 };
#endif

static const uint8_t switch2_player_pattern[] = { 0x1, 0x3, 0x7, 0xf, 0x9, 0x5, 0xd, 0x6 };

static const uint8_t switch2_feature_mask[] = {
	NS2_FEATURE_BUTTONS | NS2_FEATURE_ANALOG | NS2_FEATURE_IMU | NS2_FEATURE_RUMBLE,
	0x00, 0x00, 0x00
};

static DEFINE_IDA(switch2_player_id_allocator);

#ifdef CONFIG_SWITCH2_FF
static void switch2_encode_rumble(struct switch2_hd_rumble *rumble, uint8_t buffer[5])
{
	buffer[0] = rumble->hi_freq;
	buffer[1] = (rumble->hi_freq >> 8) | (rumble->hi_amp << 2);
	buffer[2] = (rumble->hi_amp >> 6) | (rumble->lo_freq << 4);
	buffer[3] = (rumble->lo_freq >> 4) | (rumble->lo_amp << 6);
	buffer[4] = rumble->lo_amp >> 2;
}

static int switch2_play_effect(struct input_dev *dev, void *data, struct ff_effect *effect)
{
	struct switch2_controller *ns2 = input_get_drvdata(dev);

	if (effect->type != FF_RUMBLE)
		return 0;

	guard(spinlock_irqsave)(&ns2->rumble_lock);
	if (ns2->ctlr_type == NS2_CTLR_TYPE_GC) {
		ns2->rumble.sd.amplitude = max(effect->u.rumble.strong_magnitude,
			effect->u.rumble.weak_magnitude >> 1);
	} else {
		ns2->rumble.hd.hi_amp = effect->u.rumble.weak_magnitude * RUMBLE_MAX >> 16;
		ns2->rumble.hd.lo_amp = effect->u.rumble.strong_magnitude * RUMBLE_MAX >> 16;
	}

	schedule_delayed_work(&ns2->rumble_work, 0);

	return 0;
}

static void switch2_rumble_work(struct work_struct *work)
{
	struct switch2_controller *ns2 = container_of(to_delayed_work(work),
						      struct switch2_controller, rumble_work);
	unsigned long current_ms = jiffies_to_msecs(get_jiffies_64());
	uint8_t *buffer = kzalloc(64, GFP_KERNEL);
	unsigned long flags;
	bool active;
	int ret;

	if (!buffer)
		return;

	spin_lock_irqsave(&ns2->rumble_lock, flags);
	buffer[0x1] = 0x50 | ns2->rumble_seq;
	if (ns2->ctlr_type == NS2_CTLR_TYPE_GC) {
		buffer[0] = 3;
		if (ns2->rumble.sd.amplitude == 0) {
			buffer[2] = GC_RUMBLE_STOP;
			ns2->rumble.sd.error = 0;
			active = false;
		} else {
			if (ns2->rumble.sd.error < ns2->rumble.sd.amplitude) {
				buffer[2] = GC_RUMBLE_ON;
				ns2->rumble.sd.error += U16_MAX - ns2->rumble.sd.amplitude;
			} else {
				buffer[2] = GC_RUMBLE_OFF;
				ns2->rumble.sd.error -= ns2->rumble.sd.amplitude;
			}
			active = true;
		}
	} else {
		buffer[0] = 1;
		switch2_encode_rumble(&ns2->rumble.hd, &buffer[0x2]);
		active = ns2->rumble.hd.hi_amp || ns2->rumble.hd.lo_amp;
		if (ns2->ctlr_type == NS2_CTLR_TYPE_PRO) {
			/*
			 * The Pro Controller contains separate LRAs on each
			 * side that can be controlled individually.
			 */
			buffer[0] = 2;
			buffer[0x11] = 0x50 | ns2->rumble_seq;
			switch2_encode_rumble(&ns2->rumble.hd, &buffer[0x12]);
		}
	}
	ns2->rumble_seq = (ns2->rumble_seq + 1) & 0xF;

	if (active) {
		unsigned long interval = msecs_to_jiffies(4);

		if (!ns2->last_rumble_work)
			ns2->last_rumble_work = current_ms;
		else
			ns2->last_rumble_work += interval;
		schedule_delayed_work(&ns2->rumble_work,
			ns2->last_rumble_work + interval - current_ms);
	} else {
		ns2->last_rumble_work = 0;
	}
	spin_unlock_irqrestore(&ns2->rumble_lock, flags);

	if (!ns2->hdev) {
		cancel_delayed_work(&ns2->rumble_work);
		ret = -ENODEV;
	} else {
		ret = hid_hw_output_report(ns2->hdev, buffer, 64);
	}

	kfree(buffer);
	if (ret < 0)
		hid_dbg(ns2->hdev, "Failed to send output report ret=%d\n", ret);
}
#endif

struct switch2_controller *switch2_get_controller(const char *phys)
{
	struct switch2_controller *ns2;

	guard(mutex)(&switch2_controllers_lock);
	list_for_each_entry(ns2, &switch2_controllers, entry) {
		if (strncmp(ns2->phys, phys, sizeof(ns2->phys)) == 0)
			return ns2;
	}
	ns2 = kzalloc(sizeof(*ns2), GFP_KERNEL);
	if (!ns2)
		return ERR_PTR(-ENOMEM);

	mutex_init(&ns2->lock);
	INIT_LIST_HEAD(&ns2->entry);
	list_add(&ns2->entry, &switch2_controllers);
	strscpy(ns2->phys, phys, sizeof(ns2->phys));
	return ns2;
}
EXPORT_SYMBOL_GPL(switch2_get_controller);

void switch2_controller_put(struct switch2_controller *ns2)
{
	mutex_lock(&ns2->lock);
	if (ns2->input) {
		input_unregister_device(ns2->input);
		ns2->input = NULL;
	}
	ns2->init_step = 0;
	if (ns2->hdev || ns2->cfg) {
		mutex_unlock(&ns2->lock);
		return;
	}
	mutex_unlock(&ns2->lock);
	mutex_destroy(&ns2->lock);

	mutex_lock(&switch2_controllers_lock);
	list_del_init(&ns2->entry);
	mutex_unlock(&switch2_controllers_lock);
	kfree(ns2);
}
EXPORT_SYMBOL_GPL(switch2_controller_put);

static bool switch2_parse_stick_calibration(struct switch2_stick_calibration *calib,
	const uint8_t *data)
{
	static const uint8_t UNCALIBRATED[9] = {
		0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF
	};
	if (memcmp(UNCALIBRATED, data, sizeof(UNCALIBRATED)) == 0)
		return false;

	calib->x.neutral = data[0];
	calib->x.neutral |= (data[1] & 0x0F) << 8;

	calib->y.neutral = data[1] >> 4;
	calib->y.neutral |= data[2] << 4;

	calib->x.positive = data[3];
	calib->x.positive |= (data[4] & 0x0F) << 8;

	calib->y.positive = data[4] >> 4;
	calib->y.positive |= data[5] << 4;

	calib->x.negative = data[6];
	calib->x.negative |= (data[7] & 0x0F) << 8;

	calib->y.negative = data[7] >> 4;
	calib->y.negative |= data[8] << 4;

	return true;
}

static void switch2_handle_flash_read(struct switch2_controller *ns2, uint8_t size,
	uint32_t address, const uint8_t *data)
{
	bool ok;

	switch (address) {
	case NS2_FLASH_ADDR_SERIAL:
		if (size != NS2_FLASH_SIZE_SERIAL)
			return;
		memcpy(ns2->serial, data, size);
		break;
	case NS2_FLASH_ADDR_FACTORY_PRIMARY_CALIB:
		if (size != NS2_FLASH_SIZE_FACTORY_AXIS_CALIB)
			return;
		ok = switch2_parse_stick_calibration(&ns2->stick_calib[0], data);
		if (ok) {
			hid_dbg(ns2->hdev, "Got factory primary stick calibration:\n");
			hid_dbg(ns2->hdev, "Left max: %i, neutral: %i, right max: %i\n",
				ns2->stick_calib[0].x.negative,
				ns2->stick_calib[0].x.neutral,
				ns2->stick_calib[0].x.positive);
			hid_dbg(ns2->hdev, "Down max: %i, neutral: %i, up max: %i\n",
				ns2->stick_calib[0].y.negative,
				ns2->stick_calib[0].y.neutral,
				ns2->stick_calib[0].y.positive);
		} else {
			hid_dbg(ns2->hdev, "Factory primary stick calibration not present\n");
		}
		break;
	case NS2_FLASH_ADDR_FACTORY_SECONDARY_CALIB:
		if (size != NS2_FLASH_SIZE_FACTORY_AXIS_CALIB)
			return;
		ok = switch2_parse_stick_calibration(&ns2->stick_calib[1], data);
		if (ok) {
			hid_dbg(ns2->hdev, "Got factory secondary stick calibration:\n");
			hid_dbg(ns2->hdev, "Left max: %i, neutral: %i, right max: %i\n",
				ns2->stick_calib[1].x.negative,
				ns2->stick_calib[1].x.neutral,
				ns2->stick_calib[1].x.positive);
			hid_dbg(ns2->hdev, "Down max: %i, neutral: %i, up max: %i\n",
				ns2->stick_calib[1].y.negative,
				ns2->stick_calib[1].y.neutral,
				ns2->stick_calib[1].y.positive);
		} else {
			hid_dbg(ns2->hdev, "Factory secondary stick calibration not present\n");
		}
		break;
	case NS2_FLASH_ADDR_FACTORY_TRIGGER_CALIB:
		if (size != NS2_FLASH_SIZE_FACTORY_TRIGGER_CALIB)
			return;
		if (data[0] != 0xFF && data[1] != 0xFF) {
			ns2->lt_zero = data[0];
			ns2->rt_zero = data[1];

			hid_dbg(ns2->hdev, "Got factory trigger calibration:\n");
			hid_dbg(ns2->hdev, "Left zero point: %i\n", ns2->lt_zero);
			hid_dbg(ns2->hdev, "Right zero point: %i\n", ns2->rt_zero);
		} else {
			hid_dbg(ns2->hdev, "Factory trigger calibration not present\n");
		}
		break;
	case NS2_FLASH_ADDR_USER_PRIMARY_CALIB:
		if (size != NS2_FLASH_SIZE_USER_AXIS_CALIB)
			return;
		if (__le16_to_cpu(*(__le16 *)data) != NS2_USER_CALIB_MAGIC) {
			hid_dbg(ns2->hdev, "No user primary stick calibration present\n");
			break;
		}

		ok = switch2_parse_stick_calibration(&ns2->stick_calib[0], &data[2]);
		if (ok) {
			hid_dbg(ns2->hdev, "Got user primary stick calibration:\n");
			hid_dbg(ns2->hdev, "Left max: %i, neutral: %i, right max: %i\n",
				ns2->stick_calib[0].x.negative,
				ns2->stick_calib[0].x.neutral,
				ns2->stick_calib[0].x.positive);
			hid_dbg(ns2->hdev, "Down max: %i, neutral: %i, up max: %i\n",
				ns2->stick_calib[0].y.negative,
				ns2->stick_calib[0].y.neutral,
				ns2->stick_calib[0].y.positive);
		} else {
			hid_dbg(ns2->hdev, "No user primary stick calibration present\n");
		}
		break;
	case NS2_FLASH_ADDR_USER_SECONDARY_CALIB:
		if (size != NS2_FLASH_SIZE_USER_AXIS_CALIB)
			return;
		if (__le16_to_cpu(*(__le16 *)data) != NS2_USER_CALIB_MAGIC) {
			hid_dbg(ns2->hdev, "No user secondary stick calibration present\n");
			break;
		}

		ok = switch2_parse_stick_calibration(&ns2->stick_calib[1], &data[2]);
		if (ok) {
			hid_dbg(ns2->hdev, "Got user secondary stick calibration:\n");
			hid_dbg(ns2->hdev, "Left max: %i, neutral: %i, right max: %i\n",
				ns2->stick_calib[1].x.negative,
				ns2->stick_calib[1].x.neutral,
				ns2->stick_calib[1].x.positive);
			hid_dbg(ns2->hdev, "Down max: %i, neutral: %i, up max: %i\n",
				ns2->stick_calib[1].y.negative,
				ns2->stick_calib[1].y.neutral,
				ns2->stick_calib[1].y.positive);
		} else {
			hid_dbg(ns2->hdev, "No user secondary stick calibration present\n");
		}
		break;
	}
}

int switch2_receive_command(struct switch2_controller *ns2,
	const uint8_t *message, size_t length)
{
	const struct switch2_cmd_header *header;

	if (length < 8)
		return -EINVAL;

	print_hex_dump_debug("got cmd: ", DUMP_PREFIX_OFFSET, 16, 1, message, length, false);

	guard(mutex)(&ns2->lock);
	if (ns2->init_step < NS2_INIT_DONE)
		switch2_init_controller(ns2);

	header = (const struct switch2_cmd_header *)message;
	message = &message[8];
	switch (header->command) {
	case NS2_CMD_FLASH:
		if (header->subcommand == NS2_SUBCMD_FLASH_READ) {
			uint8_t read_size;
			uint32_t read_address;

			if (length < 16)
				return -EINVAL;
			read_size = message[0];
			read_address = __le32_to_cpu(*(__le32 *)&message[4]);
			if (length < read_size + 16)
				return -EINVAL;
			switch2_handle_flash_read(ns2, read_size, read_address, &message[8]);
		}
		break;
	case NS2_CMD_FW_INFO:
		if (header->subcommand == NS2_SUBCMD_FW_INFO_GET) {
			if (length < sizeof(ns2->version))
				return -EINVAL;
			memcpy(&ns2->version, message, sizeof(ns2->version));
			ns2->ctlr_type = ns2->version.ctlr_type;
		}
		break;
	default:
		break;
	}

	return 0;
}
EXPORT_SYMBOL_GPL(switch2_receive_command);

static int switch2_features_enable(struct switch2_controller *ns2, int features)
{
	__le32 feature_bits = __cpu_to_le32(features);

	if (!ns2->cfg)
		return -ENOTCONN;
	return ns2->cfg->send_command(NS2_CMD_FEATSEL, NS2_SUBCMD_FEATSEL_ENABLE,
		&feature_bits, sizeof(feature_bits),
		ns2->cfg);
}

static int switch2_read_flash(struct switch2_controller *ns2, uint32_t address,
	uint8_t size)
{
	uint8_t message[8] = { size, 0x7e };

	if (!ns2->cfg)
		return -ENOTCONN;
	*(__le32 *)&message[4] = __cpu_to_le32(address);
	return ns2->cfg->send_command(NS2_CMD_FLASH, NS2_SUBCMD_FLASH_READ, message,
		sizeof(message), ns2->cfg);
}

static int switch2_set_player_id(struct switch2_controller *ns2, uint32_t player_id)
{
	player_id %= NS2_MAX_PLAYER_ID;
	uint8_t message[8] = { switch2_player_pattern[player_id] };

	if (!ns2->cfg)
		return -ENOTCONN;
	return ns2->cfg->send_command(NS2_CMD_LED, NS2_SUBCMD_LED_PATTERN,
		&message, sizeof(message),
		ns2->cfg);
}

static void switch2_config_buttons(struct input_dev *idev,
		 const struct switch2_ctlr_button_mapping button_mappings[])
{
	const struct switch2_ctlr_button_mapping *button;

	for (button = button_mappings; button->code; button++)
		input_set_capability(idev, EV_KEY, button->code);
}

static int switch2_init_input(struct switch2_controller *ns2)
{
	struct input_dev *input;
	struct hid_device *hdev = ns2->hdev;
#ifdef CONFIG_SWITCH2_FF
	int ret;
#endif

	rcu_read_lock();
	input = rcu_dereference(ns2->input);
	rcu_read_unlock();

	if (input)
		return 0;

	input = devm_input_allocate_device(&hdev->dev);
	if (!input)
		return -ENOMEM;

	input_set_drvdata(input, ns2);
	input->dev.parent = &hdev->dev;
	input->id.bustype = hdev->bus;
	input->id.vendor = hdev->vendor;
	input->id.product = hdev->product;
	input->id.version = hdev->version;
	input->uniq = ns2->serial;
	input->name = hdev->name;
	input->phys = hdev->phys;

	switch (ns2->ctlr_type) {
	case NS2_CTLR_TYPE_JCL:
		input_set_abs_params(input, ABS_X, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_Y, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_HAT0X, -1, 1, 0, 0);
		input_set_abs_params(input, ABS_HAT0Y, -1, 1, 0, 0);
		switch2_config_buttons(input, left_joycon_button_mappings);
		break;
	case NS2_CTLR_TYPE_JCR:
		input_set_abs_params(input, ABS_RX, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_RY, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		switch2_config_buttons(input, right_joycon_button_mappings);
		break;
	case NS2_CTLR_TYPE_GC:
		input_set_abs_params(input, ABS_X, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_Y, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_RX, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_RY, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_Z, 0, NS2_TRIGGER_RANGE, 32, 128);
		input_set_abs_params(input, ABS_RZ, 0, NS2_TRIGGER_RANGE, 32, 128);
		input_set_abs_params(input, ABS_HAT0X, -1, 1, 0, 0);
		input_set_abs_params(input, ABS_HAT0Y, -1, 1, 0, 0);
		switch2_config_buttons(input, gccon_mappings);
		break;
	case NS2_CTLR_TYPE_PRO:
		input_set_abs_params(input, ABS_X, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_Y, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_RX, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_RY, NS2_AXIS_MIN, NS2_AXIS_MAX, 32, 128);
		input_set_abs_params(input, ABS_HAT0X, -1, 1, 0, 0);
		input_set_abs_params(input, ABS_HAT0Y, -1, 1, 0, 0);
		switch2_config_buttons(input, procon_mappings);
		break;
	default:
		input_free_device(input);
		return -EINVAL;
	}

#ifdef CONFIG_SWITCH2_FF
	input_set_capability(input, EV_FF, FF_RUMBLE);
	ret = input_ff_create_memless(input, NULL, switch2_play_effect);
	if (ret) {
		input_free_device(input);
		return ret;
	}
#endif

	rcu_assign_pointer(ns2->input, input);

	hid_info(ns2->hdev, "Firmware version %u.%u.%u (%i)\n", ns2->version.major,
		ns2->version.minor, ns2->version.patch, ns2->version.ctlr_type);
	if (ns2->version.dsp_type >= 0)
		hid_info(ns2->hdev, "DSP version %u.%u.%u\n", ns2->version.dsp_major,
			ns2->version.dsp_minor, ns2->version.dsp_patch);
	return input_register_device(input);
}

int switch2_init_controller(struct switch2_controller *ns2)
{
	if (ns2->init_step == NS2_INIT_DONE)
		return 0;

	if (!ns2->cfg)
		return -ENOTCONN;

	while (ns2->init_step < NS2_INIT_DONE) {
		ns2->init_step++;
		/* TODO verify that the step completed successfully */
		switch (ns2->init_step) {
		case NS2_INIT_READ_SERIAL:
			return switch2_read_flash(ns2, NS2_FLASH_ADDR_SERIAL,
				NS2_FLASH_SIZE_SERIAL);
		case NS2_INIT_GET_FIRMWARE_INFO:
			return ns2->cfg->send_command(NS2_CMD_FW_INFO, NS2_SUBCMD_FW_INFO_GET,
				NULL, 0, ns2->cfg);
			break;
		case NS2_INIT_READ_FACTORY_PRIMARY_CALIB:
			return switch2_read_flash(ns2, NS2_FLASH_ADDR_FACTORY_PRIMARY_CALIB,
				NS2_FLASH_SIZE_FACTORY_AXIS_CALIB);
		case NS2_INIT_READ_FACTORY_SECONDARY_CALIB:
			if (switch2_ctlr_is_joycon(ns2->ctlr_type))
				break;
			return switch2_read_flash(ns2, NS2_FLASH_ADDR_FACTORY_SECONDARY_CALIB,
				NS2_FLASH_SIZE_FACTORY_AXIS_CALIB);
		case NS2_INIT_READ_FACTORY_TRIGGER_CALIB:
			if (ns2->ctlr_type != NS2_CTLR_TYPE_GC)
				break;
			return switch2_read_flash(ns2, NS2_FLASH_ADDR_FACTORY_TRIGGER_CALIB,
				NS2_FLASH_SIZE_FACTORY_TRIGGER_CALIB);
		case NS2_INIT_READ_USER_PRIMARY_CALIB:
			return switch2_read_flash(ns2, NS2_FLASH_ADDR_USER_PRIMARY_CALIB,
				NS2_FLASH_SIZE_USER_AXIS_CALIB);
		case NS2_INIT_READ_USER_SECONDARY_CALIB:
			if (switch2_ctlr_is_joycon(ns2->ctlr_type))
				break;
			return switch2_read_flash(ns2, NS2_FLASH_ADDR_USER_SECONDARY_CALIB,
				NS2_FLASH_SIZE_USER_AXIS_CALIB);
		case NS2_INIT_SET_FEATURE_MASK:
			return ns2->cfg->send_command(NS2_CMD_FEATSEL, NS2_SUBCMD_FEATSEL_SET_MASK,
				switch2_feature_mask, sizeof(switch2_feature_mask), ns2->cfg);
			break;
		case NS2_INIT_ENABLE_FEATURES:
			return switch2_features_enable(ns2, NS2_FEATURE_BUTTONS |
				NS2_FEATURE_ANALOG | NS2_FEATURE_RUMBLE);
			break;
#ifdef CONFIG_SWITCH2_FF
		case NS2_INIT_ENABLE_RUMBLE:
			return ns2->cfg->send_command(NS2_CMD_NFC, 1,
				switch2_zero_data, sizeof(switch2_zero_data),
				ns2->cfg);
			break;
#endif
		case NS2_INIT_GRIP_BUTTONS:
			if (!switch2_ctlr_is_joycon(ns2->ctlr_type))
				break;
			return ns2->cfg->send_command(NS2_CMD_GRIP, NS2_SUBCMD_GRIP_ENABLE_BUTTONS,
				switch2_one_data, sizeof(switch2_one_data),
				ns2->cfg);
			break;
		case NS2_INIT_SET_PLAYER_LEDS:
			return switch2_set_player_id(ns2, ns2->player_id);
		case NS2_INIT_INPUT:
			return ns2->cfg->send_command(NS2_CMD_INIT, NS2_SUBCMD_INIT_USB,
				switch2_init_cmd_data, sizeof(switch2_init_cmd_data), ns2->cfg);
		case NS2_INIT_DONE:
			if (ns2->hdev)
				return switch2_init_input(ns2);
			break;
		default:
			WARN_ON_ONCE(1);
		}
	}
	return 0;
}
EXPORT_SYMBOL_GPL(switch2_init_controller);

static void switch2_report_buttons(struct input_dev *input, const uint8_t *bytes,
	const struct switch2_ctlr_button_mapping button_mappings[])
{
	const struct switch2_ctlr_button_mapping *button;

	for (button = button_mappings; button->code; button++)
		input_report_key(input, button->code, bytes[button->byte] & button->bit);
}

static void switch2_report_axis(struct input_dev *input, struct switch2_axis_calibration *calib,
	int axis, int value, bool negate)
{
	if (calib && calib->neutral && calib->negative && calib->positive) {
		value -= calib->neutral;
		value *= NS2_AXIS_MAX + 1;
		if (value < 0)
			value /= calib->negative;
		else
			value /= calib->positive;
	} else {
		value = (value - 2048) * 16;
	}

	if (negate)
		value = -value;
	input_report_abs(input, axis,
		clamp(value, NS2_AXIS_MIN, NS2_AXIS_MAX));
}

static void switch2_report_stick(struct input_dev *input, struct switch2_stick_calibration *calib,
	int x, int y, const uint8_t *data)
{
	switch2_report_axis(input, &calib->x, x, data[0] | ((data[1] & 0x0F) << 8), false);
	switch2_report_axis(input, &calib->y, y, (data[1] >> 4) | (data[2] << 4), true);
}

static void switch2_report_trigger(struct input_dev *input, uint8_t zero, int abs, uint8_t data)
{
	int value = (NS2_TRIGGER_RANGE + 1) * (data - zero) / (232 - zero);

	input_report_abs(input, abs, clamp(value, 0, NS2_TRIGGER_RANGE));
}

static int switch2_event(struct hid_device *hdev, struct hid_report *report, uint8_t *raw_data,
	int size)
{
	struct switch2_controller *ns2 = hid_get_drvdata(hdev);
	struct input_dev *input;

	if (report->type != HID_INPUT_REPORT)
		return 0;

	if (size < 15)
		return -EINVAL;

	rcu_read_lock();
	input = rcu_dereference(ns2->input);
	rcu_read_unlock();

	if (!input)
		return 0;

	switch (report->id) {
	case NS2_REPORT_UNIFIED:
		/*
		 * TODO
		 * This won't be sent unless the report type gets changed via command
		 * 03-0A, but we should support it at some point regardless.
		 */
		break;
	case NS2_REPORT_JCL:
		input_report_abs(input, ABS_HAT0X,
			!!(raw_data[3] & NS2_BTNL_RIGHT) -
			!!(raw_data[3] & NS2_BTNL_LEFT));
		input_report_abs(input, ABS_HAT0Y,
			!!(raw_data[3] & NS2_BTNL_DOWN) -
			!!(raw_data[3] & NS2_BTNL_UP));
		switch2_report_stick(input, &ns2->stick_calib[0], ABS_X, ABS_Y, &raw_data[6]);
		switch2_report_buttons(input, &raw_data[3], left_joycon_button_mappings);
		break;
	case NS2_REPORT_JCR:
		switch2_report_stick(input, &ns2->stick_calib[0], ABS_RX, ABS_RY, &raw_data[6]);
		switch2_report_buttons(input, &raw_data[3], right_joycon_button_mappings);
		break;
	case NS2_REPORT_GC:
		input_report_abs(input, ABS_HAT0X,
			!!(raw_data[4] & NS2_BTNL_RIGHT) -
			!!(raw_data[4] & NS2_BTNL_LEFT));
		input_report_abs(input, ABS_HAT0Y,
			!!(raw_data[4] & NS2_BTNL_DOWN) -
			!!(raw_data[4] & NS2_BTNL_UP));
		switch2_report_buttons(input, &raw_data[3], gccon_mappings);
		switch2_report_stick(input, &ns2->stick_calib[0], ABS_X, ABS_Y, &raw_data[6]);
		switch2_report_stick(input, &ns2->stick_calib[1], ABS_RX, ABS_RY, &raw_data[9]);
		switch2_report_trigger(input, ns2->lt_zero, ABS_Z, raw_data[13]);
		switch2_report_trigger(input, ns2->rt_zero, ABS_RZ, raw_data[14]);
		break;
	case NS2_REPORT_PRO:
		input_report_abs(input, ABS_HAT0X,
			!!(raw_data[4] & NS2_BTNL_RIGHT) -
			!!(raw_data[4] & NS2_BTNL_LEFT));
		input_report_abs(input, ABS_HAT0Y,
			!!(raw_data[4] & NS2_BTNL_DOWN) -
			!!(raw_data[4] & NS2_BTNL_UP));
		switch2_report_buttons(input, &raw_data[3], procon_mappings);
		switch2_report_stick(input, &ns2->stick_calib[0], ABS_X, ABS_Y, &raw_data[6]);
		switch2_report_stick(input, &ns2->stick_calib[1], ABS_RX, ABS_RY, &raw_data[9]);
		break;
	default:
		return -EINVAL;
	}

	input_sync(input);
	return 0;
}

static int switch2_probe(struct hid_device *hdev, const struct hid_device_id *id)
{
	struct switch2_controller *ns2;
	struct usb_device *udev;
	char phys[64];
	int ret;

	if (!hid_is_usb(hdev))
		return -ENODEV;

	udev = hid_to_usb_dev(hdev);
	if (usb_make_path(udev, phys, sizeof(phys)) < 0)
		return -EINVAL;

	ret = hid_parse(hdev);
	if (ret) {
		hid_err(hdev, "parse failed %d\n", ret);
		return ret;
	}

	ret = hid_hw_start(hdev, HID_CONNECT_HIDRAW);
	if (ret) {
		hid_err(hdev, "hw_start failed %d\n", ret);
		return ret;
	}

	ret = hid_hw_open(hdev);
	if (ret) {
		hid_err(hdev, "hw_open failed %d\n", ret);
		goto err_stop;
	}

	ns2 = switch2_get_controller(phys);
	if (!ns2) {
		ret = -ENOMEM;
		goto err_close;
	}

	mutex_lock(&ns2->lock);
	ns2->hdev = hdev;

	ns2->player_id = U32_MAX;
	ret = ida_alloc(&switch2_player_id_allocator, GFP_KERNEL);
	if (ret < 0)
		hid_warn(hdev, "Failed to allocate player ID, skipping; ret=%d\n", ret);
	else
		ns2->player_id = ret;
#ifdef CONFIG_SWITCH2_FF
	if (ns2->ctlr_type != NS2_CTLR_TYPE_GC) {
		ns2->rumble.hd.hi_freq = RUMBLE_HI_FREQ;
		ns2->rumble.hd.lo_freq = RUMBLE_LO_FREQ;
	}
	spin_lock_init(&ns2->rumble_lock);
	INIT_DELAYED_WORK(&ns2->rumble_work, switch2_rumble_work);
#endif
	hid_set_drvdata(hdev, ns2);

	if (ns2->cfg) {
		ret = switch2_init_controller(ns2);
		mutex_unlock(&ns2->lock);
		return ret;
	}

	mutex_unlock(&ns2->lock);
	return 0;

err_close:
	hid_hw_close(hdev);
err_stop:
	hid_hw_stop(hdev);

	return ret;
}

static void switch2_remove(struct hid_device *hdev)
{
	struct switch2_controller *ns2 = hid_get_drvdata(hdev);
#ifdef CONFIG_SWITCH2_FF
	unsigned long flags;
#endif

#ifdef CONFIG_SWITCH2_FF
	spin_lock_irqsave(&ns2->rumble_lock, flags);
	cancel_delayed_work_sync(&ns2->rumble_work);
	spin_unlock_irqrestore(&ns2->rumble_lock, flags);
#endif
	mutex_lock(&ns2->lock);
	ns2->hdev = NULL;
	mutex_unlock(&ns2->lock);
	hid_hw_close(hdev);
	ida_free(&switch2_player_id_allocator, ns2->player_id);
	switch2_controller_put(ns2);
	hid_hw_stop(hdev);
}

static const struct hid_device_id switch2_devices[] = {
	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_JOYCONL) },
	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_JOYCONR) },
	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_PROCON) },
	{ HID_USB_DEVICE(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_GCCON) },
	{}
};
MODULE_DEVICE_TABLE(hid, switch2_devices);

static struct hid_driver switch2_hid_driver = {
	.name		= "switch2",
	.id_table	= switch2_devices,
	.probe		= switch2_probe,
	.remove		= switch2_remove,
	.raw_event	= switch2_event,
};

static int __init switch2_init(void)
{
	return hid_register_driver(&switch2_hid_driver);
}

static void __exit switch2_exit(void)
{
	hid_unregister_driver(&switch2_hid_driver);
	ida_destroy(&switch2_player_id_allocator);
}

module_init(switch2_init);
module_exit(switch2_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Vicki Pfau <vi@endrift.com>");
MODULE_DESCRIPTION("Driver for Nintendo Switch 2 Controllers");
