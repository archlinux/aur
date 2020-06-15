#!/bin/bash

PT7HOME=/opt/packettracer/
export PT7HOME

function version_gt() { test "$(printf '%s\n' "$@" | sort -V | head -n 1)" != "$1"; }

QT_VERSION=`qmake -v | grep "Using Qt version" | sed -r 's/.* ([0-9]+\.*[0-9]+\.*[0-9]*).*?/\1/'`
QT_VERSION_CHECK="5.5.0"

if version_gt $QT_VERSION $QT_VERSION_CHECK;then
QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_AUTO_SCREEN_SCALE_FACTOR
else
QT_DEVICE_PIXEL_RATIO=auto
export QT_DEVICE_PIXEL_RATIO
fi

