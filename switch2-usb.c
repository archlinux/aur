// SPDX-License-Identifier: GPL-2.0+
/*
 * HID driver for Nintendo Switch controllers
 *
 * Copyright (c) 2025 Valve Software
 *
 * This driver is based on the following work:
 *   https://gist.github.com/shinyquagsire23/66f006b46c56216acbaac6c1e2279b64
 *   https://github.com/ndeadly/switch2_controller_research
 */

#include "hid-switch2.h"
#include <linux/module.h>
#include <linux/usb/input.h>

#define NS2_BULK_SIZE 64
#define NS2_IN_URBS 2
#define NS2_OUT_URBS 4

static struct usb_driver switch2_usb;

struct switch2_urb {
	struct urb *urb;
	uint8_t *data;
	bool active;
};

struct switch2_usb {
	struct switch2_cfg_intf cfg;
	struct usb_device *udev;

	struct switch2_urb bulk_in[NS2_IN_URBS];
	struct usb_anchor bulk_in_anchor;
	spinlock_t bulk_in_lock;

	struct switch2_urb bulk_out[NS2_OUT_URBS];
	struct usb_anchor bulk_out_anchor;
	spinlock_t bulk_out_lock;

	int message_in;
	struct work_struct message_in_work;
};

static void switch2_bulk_in(struct urb *urb)
{
	struct switch2_usb *ns2_usb = urb->context;
	int i;
	bool schedule = false;
	unsigned long flags;

	switch (urb->status) {
	case 0:
		schedule = true;
		break;
	case -ECONNRESET:
	case -ENOENT:
	case -ESHUTDOWN:
		return;
	default:
		dev_dbg(&ns2_usb->udev->dev, "unknown urb status: %d\n",
			urb->status);
		break;
	}

	spin_lock_irqsave(&ns2_usb->bulk_in_lock, flags);
	for (i = 0; i < NS2_IN_URBS; i++) {
		int err;
		struct switch2_urb *ns2_urb;

		if (ns2_usb->bulk_in[i].urb == urb) {
			ns2_usb->message_in = i;
			continue;
		}

		if (ns2_usb->bulk_in[i].active)
			continue;

		ns2_urb = &ns2_usb->bulk_in[i];
		usb_anchor_urb(ns2_urb->urb, &ns2_usb->bulk_out_anchor);
		err = usb_submit_urb(ns2_urb->urb, GFP_ATOMIC);
		if (err) {
			usb_unanchor_urb(ns2_urb->urb);
			dev_dbg(&ns2_usb->udev->dev, "failed to queue input urb: %d\n", err);
		} else {
			ns2_urb->active = true;
		}
	}
	spin_unlock_irqrestore(&ns2_usb->bulk_in_lock, flags);

	if (schedule)
		schedule_work(&ns2_usb->message_in_work);
}

static void switch2_bulk_out(struct urb *urb)
{
	struct switch2_usb *ns2_usb = urb->context;
	int i;

	guard(spinlock_irqsave)(&ns2_usb->bulk_out_lock);

	switch (urb->status) {
	case 0:
		break;
	case -ECONNRESET:
	case -ENOENT:
	case -ESHUTDOWN:
		return;
	default:
		dev_dbg(&ns2_usb->udev->dev, "unknown urb status: %d\n", urb->status);
		return;
	}

	for (i = 0; i < NS2_OUT_URBS; i++) {
		if (ns2_usb->bulk_out[i].urb != urb)
			continue;

		ns2_usb->bulk_out[i].active = false;
		break;
	}
}

static int switch2_usb_send_cmd(enum switch2_cmd command, uint8_t subcommand,
	const void *message, size_t size, struct switch2_cfg_intf *cfg)
{
	struct switch2_usb *ns2_usb = (struct switch2_usb *)cfg;
	struct switch2_urb *urb = NULL;
	int i;
	int ret;

	struct switch2_cmd_header header = {
		command, NS2_DIR_OUT | NS2_FLAG_OK, NS2_TRANS_USB, subcommand, 0, size
	};

	if (WARN_ON(size > 56))
		return -EINVAL;

	for (i = 0; i < NS2_OUT_URBS; i++) {
		if (ns2_usb->bulk_out[i].active)
			continue;

		urb = &ns2_usb->bulk_out[i];
		urb->active = true;
		break;
	}
	if (!urb) {
		dev_warn(&ns2_usb->udev->dev, "output queue full, dropping message\n");
		return -ENOBUFS;
	}

	memcpy(urb->data, &header, sizeof(header));
	if (message && size)
		memcpy(&urb->data[8], message, size);
	urb->urb->transfer_buffer_length = size + sizeof(header);

	print_hex_dump_debug("sending cmd: ", DUMP_PREFIX_OFFSET, 16, 1, urb->data,
		size + sizeof(header), false);

	usb_anchor_urb(urb->urb, &ns2_usb->bulk_out_anchor);
	ret = usb_submit_urb(urb->urb, GFP_ATOMIC);
	if (ret) {
		dev_warn(&ns2_usb->udev->dev, "failed to submit urb: %i", ret);
		urb->active = false;
		usb_unanchor_urb(urb->urb);
		return ret;
	}

	return 0;
}

static void switch2_usb_message_in_work(struct work_struct *work)
{
	struct switch2_usb *ns2_usb = container_of(work, struct switch2_usb, message_in_work);
	struct switch2_urb *urb;
	int err;
	unsigned long flags;

	spin_lock_irqsave(&ns2_usb->bulk_in_lock, flags);
	urb = &ns2_usb->bulk_in[ns2_usb->message_in];
	spin_unlock_irqrestore(&ns2_usb->bulk_in_lock, flags);

	err = switch2_receive_command(ns2_usb->cfg.parent, urb->urb->transfer_buffer,
		urb->urb->actual_length);
	if (err)
		dev_dbg(&ns2_usb->udev->dev, "receive command failed: %d\n", err);

	spin_lock_irqsave(&ns2_usb->bulk_in_lock, flags);
	urb->active = false;
	spin_unlock_irqrestore(&ns2_usb->bulk_in_lock, flags);
}

static int switch2_usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
{
	struct switch2_controller *ns2;
	struct switch2_usb *ns2_usb;
	struct usb_device *udev;
	struct usb_endpoint_descriptor *bulk_in, *bulk_out;
	char phys[64];
	int ret;
	int i;

	udev = interface_to_usbdev(intf);
	if (usb_make_path(udev, phys, sizeof(phys)) < 0)
		return -EINVAL;

	ret = usb_find_common_endpoints(intf->cur_altsetting, &bulk_in, &bulk_out, NULL, NULL);
	if (ret) {
		dev_err(&intf->dev, "failed to find bulk EPs\n");
		return ret;
	}

	ns2_usb = devm_kzalloc(&intf->dev, sizeof(*ns2_usb), GFP_KERNEL);
	if (!ns2_usb)
		return -ENOMEM;

	ns2_usb->udev = udev;
	for (i = 0; i < NS2_IN_URBS; i++) {
		ns2_usb->bulk_in[i].urb = usb_alloc_urb(0, GFP_KERNEL);
		if (!ns2_usb->bulk_in[i].urb) {
			ret = -ENOMEM;
			goto err_free_in;
		}

		ns2_usb->bulk_in[i].data = usb_alloc_coherent(udev, NS2_BULK_SIZE, GFP_KERNEL,
			&ns2_usb->bulk_in[i].urb->transfer_dma);
		if (!ns2_usb->bulk_in[i].data) {
			ret = -ENOMEM;
			goto err_free_in;
		}

		usb_fill_bulk_urb(ns2_usb->bulk_in[i].urb, udev,
			usb_rcvbulkpipe(udev, bulk_in->bEndpointAddress),
			ns2_usb->bulk_in[i].data, NS2_BULK_SIZE, switch2_bulk_in, ns2_usb);
		ns2_usb->bulk_in[i].urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
	}

	for (i = 0; i < NS2_OUT_URBS; i++) {
		ns2_usb->bulk_out[i].urb = usb_alloc_urb(0, GFP_KERNEL);
		if (!ns2_usb->bulk_out[i].urb) {
			ret = -ENOMEM;
			goto err_free_out;
		}

		ns2_usb->bulk_out[i].data = usb_alloc_coherent(udev, NS2_BULK_SIZE, GFP_KERNEL,
			&ns2_usb->bulk_out[i].urb->transfer_dma);
		if (!ns2_usb->bulk_out[i].data) {
			ret = -ENOMEM;
			goto err_free_out;
		}

		usb_fill_bulk_urb(ns2_usb->bulk_out[i].urb, udev,
			usb_sndbulkpipe(udev, bulk_out->bEndpointAddress),
			ns2_usb->bulk_out[i].data, NS2_BULK_SIZE, switch2_bulk_out, ns2_usb);
		ns2_usb->bulk_out[i].urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
	}

	ns2_usb->bulk_in[0].active = true;
	ret = usb_submit_urb(ns2_usb->bulk_in[0].urb, GFP_ATOMIC);
	if (ret < 0)
		goto err_free_out;

	ns2 = switch2_get_controller(phys);
	if (IS_ERR(ns2)) {
		ret = PTR_ERR(ns2);
		goto err_kill_urb;
	}

	ns2_usb->cfg.parent = ns2;
	ns2_usb->cfg.send_command = switch2_usb_send_cmd;

	init_usb_anchor(&ns2_usb->bulk_out_anchor);
	spin_lock_init(&ns2_usb->bulk_out_lock);
	init_usb_anchor(&ns2_usb->bulk_in_anchor);
	spin_lock_init(&ns2_usb->bulk_in_lock);
	INIT_WORK(&ns2_usb->message_in_work, switch2_usb_message_in_work);

	usb_set_intfdata(intf, ns2_usb);

	mutex_lock(&ns2->lock);
	ns2->cfg = (struct switch2_cfg_intf *) ns2_usb;

	if (ns2->hdev) {
		ret = switch2_init_controller(ns2);
		mutex_unlock(&ns2->lock);
		return ret;
	}

	mutex_unlock(&ns2->lock);
	return 0;

err_kill_urb:
	usb_kill_urb(ns2_usb->bulk_in[0].urb);
err_free_out:
	for (i = 0; i < NS2_OUT_URBS; i++) {
		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_out[i].data,
			ns2_usb->bulk_out[i].urb->transfer_dma);
		usb_free_urb(ns2_usb->bulk_out[i].urb);
	}
err_free_in:
	for (i = 0; i < NS2_IN_URBS; i++) {
		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_in[i].data,
			ns2_usb->bulk_in[i].urb->transfer_dma);
		usb_free_urb(ns2_usb->bulk_in[i].urb);
	}
	devm_kfree(&intf->dev, ns2_usb);

	return ret;
}

static void switch2_usb_disconnect(struct usb_interface *intf)
{
	struct switch2_usb *ns2_usb = usb_get_intfdata(intf);
	struct switch2_controller *ns2 = ns2_usb->cfg.parent;
	int i;

	usb_kill_anchored_urbs(&ns2_usb->bulk_out_anchor);
	for (i = 0; i < NS2_OUT_URBS; i++) {
		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_out[i].data,
			ns2_usb->bulk_out[i].urb->transfer_dma);
		usb_free_urb(ns2_usb->bulk_out[i].urb);
	}

	usb_kill_anchored_urbs(&ns2_usb->bulk_in_anchor);
	for (i = 0; i < NS2_IN_URBS; i++) {
		usb_free_coherent(ns2_usb->udev, NS2_BULK_SIZE, ns2_usb->bulk_in[i].data,
			ns2_usb->bulk_in[i].urb->transfer_dma);
		usb_free_urb(ns2_usb->bulk_in[i].urb);
	}

	mutex_lock(&ns2->lock);
	ns2->cfg = NULL;
	mutex_unlock(&ns2->lock);
	switch2_controller_put(ns2);
}

#define SWITCH2_CONTROLLER(vend, prod) \
	USB_DEVICE_AND_INTERFACE_INFO(vend, prod, USB_CLASS_VENDOR_SPEC, 0, 0)

static const struct usb_device_id switch2_usb_devices[] = {
	{ SWITCH2_CONTROLLER(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_JOYCONL) },
	{ SWITCH2_CONTROLLER(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_JOYCONR) },
	{ SWITCH2_CONTROLLER(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_PROCON) },
	{ SWITCH2_CONTROLLER(USB_VENDOR_ID_NINTENDO, USB_DEVICE_ID_NINTENDO_NS2_GCCON) },
	{ }
};
MODULE_DEVICE_TABLE(usb, switch2_usb_devices);

static struct usb_driver switch2_usb = {
	.name		= "switch2",
	.id_table	= switch2_usb_devices,
	.probe		= switch2_usb_probe,
	.disconnect	= switch2_usb_disconnect,
};
module_usb_driver(switch2_usb);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Vicki Pfau <vi@endrift.com>");
MODULE_DESCRIPTION("Driver for Nintendo Switch 2 Controllers");
