#!/bin/sh


TOOL="$(dirname $0)/k480_conf"
# Check if this device is our keyboard: 046D:B33D
DEV="$(ls /sys/class/hidraw/ -l | grep 046D:B33D | grep -o 'hidraw[0-9]*$')"

# Run if parameter $1 is nothing or it is the K480 keyboard.
if test -n "$DEV" && (test -z "$1" || test "/dev/$DEV" = "$1")
then
    echo "Found K480 at $DEV"
    $TOOL -d "/dev/$DEV" -f on
fi


