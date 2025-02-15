#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-only

## Kill previously running instances
kill `pgrep -f touch_keyboard_handler`

## This program is dumb, so for it to work it has to be ran in its configuration directory
cd /etc/touch_keyboard
/usr/lib/yogabook-touch-keyboard/touch_keyboard_handler &

