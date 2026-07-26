#!/usr/bin/sh
# SPDX-License-Identifier: 0BSD

# Armorpaint will seemingly search inside the same dir that the binary is in 
# for the data
# and as for args it will coredumpt if it is not valid file and it wants full paths

if [ -n "$1" ]; then
    exec /usr/lib/armorpaint/ArmorPaint "$(realpath "$1")"
else
    exec /usr/lib/armorpaint/ArmorPaint
fi
