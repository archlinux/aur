#include <linux/module.h>
#include <linux/hid.h>
#include <linux/power_supply.h>

#define USB_VENDOR_ID_RAPOO                 0x24ae
#define USB_DEVICE_ID_RAPOO_VT3_PRO         0x1215
#define USB_DEVICE_ID_RAPOO_VT3_PRO_MAX     0x1244
#define USB_DEVICE_ID_RAPOO_VT3_MAX_GEN2    0x3102
#define USB_DEVICE_ID_RAPOO_VT9_PRO         0x1417
#define USB_DEVICE_ID_RAPOO_VT9_PRO_MINI    0x3103

#define RAPOO_BATTERY_REPORT_ID             0xBB
#define RAPOO_BATTERY_REPORT_SIZE           7
#define RAPOO_BATTERY_INDEX                 6
#define RAPOO_CHARGING_INDEX                5

#define RAPOO_CHARGING_CHARGING             0x02

struct rapoo_data {
	struct power_supply *battery;
	int battery_capacity;
	bool battery_charging;
	const char *model_name;
};

static int rapoo_raw_event(struct hid_device *hdev, struct hid_report *report,
			   u8 *data, int size)
{
	struct rapoo_data *rdata = hid_get_drvdata(hdev);
	if (!rdata)
		return 0;

	if (size == RAPOO_BATTERY_REPORT_SIZE && data[0] == RAPOO_BATTERY_REPORT_ID) {
		int new_capacity = data[RAPOO_BATTERY_INDEX];
		bool new_charging = (data[RAPOO_CHARGING_INDEX] == RAPOO_CHARGING_CHARGING);

		if (new_capacity > 100)
			return 0;

		if (rdata->battery_capacity != new_capacity ||
		    rdata->battery_charging != new_charging) {
			rdata->battery_capacity = new_capacity;
			rdata->battery_charging = new_charging;
			power_supply_changed(rdata->battery);
		}
	}

	return 0;
}

static int battery_capacity_to_level(int capacity)
{
	if (capacity < 0)
		return POWER_SUPPLY_CAPACITY_LEVEL_UNKNOWN;
	if (capacity > 75)
		return POWER_SUPPLY_CAPACITY_LEVEL_HIGH;
	if (capacity > 20)
		return POWER_SUPPLY_CAPACITY_LEVEL_NORMAL;
	if (capacity > 5)
		return POWER_SUPPLY_CAPACITY_LEVEL_LOW;
	return POWER_SUPPLY_CAPACITY_LEVEL_CRITICAL;
}

static int rapoo_get_property(struct power_supply *psy,
			      enum power_supply_property psp,
			      union power_supply_propval *val)
{
	struct rapoo_data *rdata = power_supply_get_drvdata(psy);

	switch (psp) {
	case POWER_SUPPLY_PROP_STATUS:
		if (rdata->battery_charging)
			val->intval = POWER_SUPPLY_STATUS_CHARGING;
		else
			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
		break;
	case POWER_SUPPLY_PROP_CAPACITY:
		val->intval = rdata->battery_capacity;
		break;
	case POWER_SUPPLY_PROP_SCOPE:
		val->intval = POWER_SUPPLY_SCOPE_DEVICE;
		break;
	case POWER_SUPPLY_PROP_CAPACITY_LEVEL:
		val->intval = battery_capacity_to_level(rdata->battery_capacity);
		break;
	case POWER_SUPPLY_PROP_MANUFACTURER:
		val->strval = "Rapoo";
		break;
	case POWER_SUPPLY_PROP_MODEL_NAME:
		val->strval = rdata->model_name;
		break;
	default:
		return -EINVAL;
	}
	return 0;
}

static enum power_supply_property rapoo_psy_properties[] = {
	POWER_SUPPLY_PROP_STATUS,
	POWER_SUPPLY_PROP_CAPACITY,
	POWER_SUPPLY_PROP_SCOPE,
	POWER_SUPPLY_PROP_CAPACITY_LEVEL,
	POWER_SUPPLY_PROP_MANUFACTURER,
	POWER_SUPPLY_PROP_MODEL_NAME,
};

static const char *rapoo_model_name(u16 product)
{
	switch (product) {
	case USB_DEVICE_ID_RAPOO_VT3_PRO:
		return "VT3 Pro";
	case USB_DEVICE_ID_RAPOO_VT3_PRO_MAX:
		return "VT3 Pro Max";
	case USB_DEVICE_ID_RAPOO_VT3_MAX_GEN2:
		return "VT3 Max Gen-2";
	case USB_DEVICE_ID_RAPOO_VT9_PRO:
		return "VT9 Pro";
	case USB_DEVICE_ID_RAPOO_VT9_PRO_MINI:
		return "VT9 Pro Mini";
	default:
		return NULL;
	}
}

static int rapoo_probe(struct hid_device *hdev, const struct hid_device_id *id)
{
	struct rapoo_data *rdata;
	struct power_supply_config psy_cfg = {};
	struct power_supply_desc *psy_desc;
	int ret;

	ret = hid_parse(hdev);
	if (ret) {
		hid_err(hdev, "parse failed\n");
		return ret;
	}

	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
	if (ret) {
		hid_err(hdev, "hw start failed\n");
		return ret;
	}

	if (hdev->collection->usage == HID_GD_MOUSE) {
		hid_info(hdev, "Skipping mouse interface %s\n", hdev->name);
		hid_set_drvdata(hdev, NULL);
		return 0;
	}

	hid_info(hdev, "Found battery interface. Setting up battery reporting.\n");

	rdata = devm_kzalloc(&hdev->dev, sizeof(*rdata), GFP_KERNEL);
	if (!rdata)
		return -ENOMEM;

	rdata->model_name = rapoo_model_name(id->product);
	if (!rdata->model_name)
		rdata->model_name = hdev->name;

	hid_info(hdev, "Detected model: %s\n", rdata->model_name);

	hid_set_drvdata(hdev, rdata);
	rdata->battery_capacity = -1;
	rdata->battery_charging = false;

	psy_desc = devm_kzalloc(&hdev->dev, sizeof(*psy_desc), GFP_KERNEL);
	if (!psy_desc)
		return -ENOMEM;

	psy_desc->name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
					"rapoo-%04x-%04x", id->vendor, id->product);
	psy_desc->type = POWER_SUPPLY_TYPE_BATTERY;
	psy_desc->properties = rapoo_psy_properties;
	psy_desc->num_properties = ARRAY_SIZE(rapoo_psy_properties);
	psy_desc->get_property = rapoo_get_property;

	psy_cfg.drv_data = rdata;

	rdata->battery = devm_power_supply_register(&hdev->dev, psy_desc, &psy_cfg);
	if (IS_ERR(rdata->battery)) {
		hid_err(hdev, "Failed to register power_supply\n");
		return PTR_ERR(rdata->battery);
	}

	return 0;
}

static void rapoo_remove(struct hid_device *hdev)
{
	hid_hw_stop(hdev);
}

static const struct hid_device_id rapoo_devices[] = {
	{ HID_USB_DEVICE(USB_VENDOR_ID_RAPOO, USB_DEVICE_ID_RAPOO_VT3_PRO) },
	{ HID_USB_DEVICE(USB_VENDOR_ID_RAPOO, USB_DEVICE_ID_RAPOO_VT3_PRO_MAX) },
	{ HID_USB_DEVICE(USB_VENDOR_ID_RAPOO, USB_DEVICE_ID_RAPOO_VT3_MAX_GEN2) },
	{ HID_USB_DEVICE(USB_VENDOR_ID_RAPOO, USB_DEVICE_ID_RAPOO_VT9_PRO) },
	{ HID_USB_DEVICE(USB_VENDOR_ID_RAPOO, USB_DEVICE_ID_RAPOO_VT9_PRO_MINI) },
	{ }
};
MODULE_DEVICE_TABLE(hid, rapoo_devices);

static struct hid_driver rapoo_driver = {
	.name        = "rapoo",
	.id_table    = rapoo_devices,
	.probe       = rapoo_probe,
	.remove      = rapoo_remove,
	.raw_event   = rapoo_raw_event,
};

module_hid_driver(rapoo_driver);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("dov-vai");
MODULE_DESCRIPTION("HID driver for Rapoo gaming mice battery reporting");
