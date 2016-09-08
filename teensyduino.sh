#!/bin/bash

sleep 2

export HOME=$2
$1 &

sleep 5
xdotool search --class "teensyduino" \
    windowfocus \
    key space sleep 1 \
    key Tab sleep 0.4 \
    key Tab sleep 0.4 \
    key Tab sleep 0.4 \
    key Tab sleep 0.4 \
    key space sleep 1 \
    key Tab sleep 0.4 \
    key Tab sleep 0.4 \
    key Tab sleep 0.4 \
    key Tab sleep 0.4 \
    key space sleep 1 \
    key Tab sleep 0.4 \
    key space sleep 35

killall $(basename $1) >/dev/null || exit 1
[ -d $2/hardware/teensy ] || exit 1
