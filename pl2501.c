/*
 * PL-2501 USB host-to-host link cables
 * Copyright (C) 2000-2005 by David Brownell
 * Copyright (C) 2012 by others
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#include <linux/module.h>
#include <linux/init.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/ethtool.h>
#include <linux/workqueue.h>
#include <linux/mii.h>
#include <linux/usb.h>
#include <linux/usb/usbnet.h>

/*
 * Bits 0-4 can be used for software handshaking; they're set from
 * one end, cleared from the other, "read" with the interrupt byte.
 */
#define	PL2501_S_EN		(1<<7)		/* (feature only) suspend enable */
/* reserved bit -- rx ready (6) ? */
#define	PL2501_TX_READY		(1<<5)	/* (interrupt only) transmit ready */
#define	PL2501_RESET_OUT	(1<<4)	/* reset output pipe */
#define	PL2501_RESET_IN		(1<<3)	/* reset input pipe */
#define	PL2501_TX_C		(1<<2)	/* transmission complete */
#define	PL2501_TX_REQ		(1<<1)	/* transmission received */
#define	PL2501_PEER_E		(1<<0)	/* peer exists */

static inline int
pl2501_vendor_req(struct usbnet *dev, u8 req, u8 val, u8 index)
{
	return usb_control_msg(dev->udev,
		usb_rcvctrlpipe(dev->udev, 0),
		req,
		USB_DIR_IN | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
		val, index,
		NULL, 0,
		USB_CTRL_GET_TIMEOUT);
}

static inline int
pl2501_clear_QuickLink_features(struct usbnet *dev, int val)
{
	return pl2501_vendor_req(dev, 1, (u8) val, 0);
}

static inline int
pl2501_set_QuickLink_features(struct usbnet *dev, int val)
{
	return pl2501_vendor_req(dev, 3, (u8) val, 0);
}

static int pl2501_reset(struct usbnet *dev)
{
	int status;

	/* some units seem to need this reset, others reject it utterly.
	 * FIXME be more like "naplink" or windows drivers.
	 */
	status = pl2501_set_QuickLink_features(dev,
		PL2501_S_EN|PL2501_RESET_OUT|PL2501_RESET_IN|PL2501_PEER_E);
	if (status != 0 && netif_msg_probe(dev))
		netif_dbg(dev, link, dev->net, "pl2501_reset --> %d\n", status);
	return 0;
}

static const struct driver_info	prolific_info = {
	.description =	"Prolific PL-2501",
	.flags =	FLAG_POINTTOPOINT | FLAG_NO_SETINT,
		/* some PL-2302 versions seem to fail usb_set_interface() */
	.reset =	pl2501_reset,
};


/*-------------------------------------------------------------------------*/

/*
 * Proilific's name won't normally be on the cables, and
 * may not be on the device.
 */

static const struct usb_device_id	products [] = {

{
	USB_DEVICE(0x067b, 0x2501),     /* (PL-2501) */
	.driver_info =  (unsigned long) &prolific_info,
},

	{ },		// END
};
MODULE_DEVICE_TABLE(usb, products);

static struct usb_driver pl2501_driver = {
	.name =		"pl2501",
	.id_table =	products,
	.probe =	usbnet_probe,
	.disconnect =	usbnet_disconnect,
	.suspend =	usbnet_suspend,
	.resume =	usbnet_resume,
	.disable_hub_initiated_lpm = 1,
};

module_usb_driver(pl2501_driver);

MODULE_AUTHOR("David Brownell and others");
MODULE_DESCRIPTION("Prolific PL-2501 USB Host to Host Link Driver");
MODULE_LICENSE("GPL");
