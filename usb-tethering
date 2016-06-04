#!/bin/bash

####
# Default profile
USB_IDVENDOR=0fce
USB_IDPRODUCT=7169
USB_IPRODUCT="Unknown"
USB_ISERIAL="Unknown"
USB_IMANUFACTURER="GNU/Linux Device"
USB_IFACE=""

####
# Override profile
if [ -f /etc/default/hybris-device ]; then
    source /etc/default/hybris-device
fi

ANDROID_USB=/sys/class/android_usb/android0
USB_FUNCTIONS=rndis
LOCAL_IP=10.15.19.82

write() {
    echo -n "$2" > "$1"
}

usb_setup() {
    write $ANDROID_USB/enable        0
    write $ANDROID_USB/idVendor      $USB_IDVENDOR
    write $ANDROID_USB/idProduct     $USB_IDPRODUCT
    write $ANDROID_USB/iManufacturer "$USB_IMANUFACTURER"
    write $ANDROID_USB/iProduct      "$USB_IPRODUCT"
    write $ANDROID_USB/iSerial       "$USB_ISERIAL"
    write $ANDROID_USB/functions     $USB_FUNCTIONS
    write $ANDROID_USB/enable        1
}

usb_info() {
    write $ANDROID_USB/iSerial       "$1"
}

ip_setup() {
    if [ -n "$USB_IFACE" ]; then
        ifconfig $USB_IFACE $LOCAL_IP
        return
    fi
    
    ifconfig rndis0 $LOCAL_IP && USB_IFACE=rndis0
    if [ -z "$USB_IFACE" ]; then
        ifconfig usb0 $LOCAL_IP && USB_IFACE=usb0
    fi

    if [ -z "$USB_IFACE" ]; then
        usb_info "could not setup USB tethering!"
        return 1
    fi

    usb_info "$USB_IMANUFACTURER on $USB_IFACE $LOCAL_IP"
}

usb_setup
ip_setup

exit $?
