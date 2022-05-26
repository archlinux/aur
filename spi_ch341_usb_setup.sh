#!/bin/bash

for i in /sys/bus/usb/drivers/spi-ch341-usb/*/spi_master/spi*/spi*.*; do
    echo spidev > $i/driver_override; echo $(basename $i) > /sys/bus/spi/drivers/spidev/bind
done
