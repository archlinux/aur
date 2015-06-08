#!/usr/bin/env python2

# blackwidow_enable.py
#
# Enables the M1-5 and FN keys to send scancodes on the Razer BlackWidow
# and BlackWidow Ultimate keyboards.
#
# Requires the PyUSB library.
#
# By Michael Fincham <michael@finch.am> 2012-03-05
# This code is released in to the public domain.

import sys
import usb

USB_VENDOR = 0x1532  # Razer
USB_PRODUCT = 0x011a  # BlackWidow / BlackWidow Ultimate
#USB_PRODUCT = 0x010d  # BlackWidow / BlackWidow Ultimate
#USB_PRODUCT = 0x011b  # BlackWidow / BlackWidow Ultimate

# These values are from the USB HID 1.11 spec section 7.2.
# <http://www.usb.org/developers/devclass_docs/HID1_11.pdf>
USB_REQUEST_TYPE = 0x21  # Host To Device | Class | Interface
USB_REQUEST = 0x09  # SET_REPORT

# These values are from the manufacturer's driver.
USB_VALUE = 0x0300
USB_INDEX = 0x2
USB_INTERFACE = 2

# These magic bytes are also from the manufacturer's driver.
#USB_BUFFER = b"\x00\x00\x00\x00\x00\x01\x00\x04\x03\x00\x00\x00\x00\x00\
#\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
#\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
#\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
#\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x06\x00"
#
USB_BUFFER = b"\
\x00\x00\x00\x00\x00\x02\x00\x04\x02\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\
\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00"
def find_keyboard_device():
    for bus in usb.busses():
        for device in bus.devices:
            if device.idVendor == USB_VENDOR and \
               device.idProduct == USB_PRODUCT:
                return device


def main():

    device = find_keyboard_device()
    if device == None:
        sys.stderr.write("BlackWidow not found.\n")
        sys.exit(1)

    try:
        handle = device.open()
        interface = device.configurations[0].interfaces[USB_INTERFACE][0]
        endpoint = interface.endpoints[0]
    except:
        sys.stderr.write("Could not select configuration endpoint.\n")
        sys.exit(1)

    try:
        handle.detachKernelDriver(interface)
    except usb.USBError:
        pass  # This is usually because the enabler was run before and the kernel is still detached
    except Exception:
        sys.stderr.write("A very unusual error happened trying to detch the kernel driver.\n")
        sys.exit(1)

    try:
        handle.claimInterface(interface)
    except:
        sys.stderr.write("Unable to claim the configuration interface. Do you have the appropriate privileges?\n")
        sys.exit(1)

    result = 0

    try:
        result = handle.controlMsg(requestType=USB_REQUEST_TYPE,
                                   request=USB_REQUEST,
                                   value=USB_VALUE,
                                   index=USB_INDEX,
                                   buffer=USB_BUFFER)
    except:
        sys.stderr.write("Could not write the magic bytes to the BlackWidow.\n")

    if result == len(USB_BUFFER):
        sys.stderr.write("Configured BlackWidow.\n")

    try:
        handle.releaseInterface()
    except:
        sys.stderr.write("Unable to release interface.\n")
        sys.exit(1)

    sys.exit(0)

if __name__ == "__main__":
    main()
