#!/usr/bin/bash
# manually start the bluetooth device BCM43142A0

# set the vendor and product ID
echo "105b e065" > /sys/bus/usb/drivers/btusb/new_id

# start the device
hciconfig hci0 up

# the device can be stopped with "sudo hciconfig hci0 down"
