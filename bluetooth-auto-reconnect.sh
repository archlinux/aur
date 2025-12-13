#!/bin/bash

FILE=/tmp/connected_bluetooth_devices

case "$1" in
    pre)
        bluetoothctl devices Connected | cut -d' ' -f2 > $FILE
        ;;
    post)
        # Wait for bluetooth service to be fully started
        sleep 3

        # Reconnect previously connected devices first
        [ -f $FILE ] && {
            for d in `cat $FILE`; do
                bluetoothctl connect $d
            done
        }
        rm $FILE

        # Try to connect all trusted devices
        for d in `bluetoothctl devices Trusted | cut -d' ' -f2`; do
            bluetoothctl connect $d
        done
        ;;
esac

