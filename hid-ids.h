#ifndef LOCAL_HID_IDS_H
#define LOCAL_HID_IDS_H

#include <linux/hid.h> /* Pulls in standard kernel hid-ids */

/* Nintendo vendor ID — defined in the kernel's private drivers/hid/hid-ids.h */
#ifndef USB_VENDOR_ID_NINTENDO
#define USB_VENDOR_ID_NINTENDO	0x057e
#endif

/* Add the missing Switch 2 IDs from the patch */
#define USB_DEVICE_ID_NINTENDO_NS2_JOYCONR  0x2066
#define USB_DEVICE_ID_NINTENDO_NS2_JOYCONL  0x2067
#define USB_DEVICE_ID_NINTENDO_NS2_PROCON   0x2069
#define USB_DEVICE_ID_NINTENDO_NS2_GCCON    0x2073

#endif
