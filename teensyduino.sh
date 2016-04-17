#!/bin/bash

sleep 2

export HOME=$2
$1 &

sleep 5
xdotool search --class "teensyduino" \
    windowfocus \
    key --delay 1000 space \
    key --delay 400 Tab \
    key --delay 400 Tab \
    key --delay 400 Tab \
    key --delay 400 Tab \
    key --delay 1000 space \
    key --delay 400 Tab \
    key --delay 400 Tab \
    key --delay 400 Tab \
    key --delay 400 Tab \
    key --delay 400 space \
    key --delay 400 Tab \
    key --delay 40000 space

killall $(basename $1) >/dev/null || exit 1
[ -d $2/hardware/teensy ] || exit 1
