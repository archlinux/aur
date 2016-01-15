#!/bin/bash
#
# This script checks and toggles the backlight status of a CoolMaster Devistator
# LED keyboard
#
# - GI_Jack -  License: GPLv3
declare FLAGS

# get status of LED as a series of flags. the last set of numbers tends to vary
# with caps and numlock set. scroll lock is locked to the LED key and won't
# toggle normally. It will only toggle with the LEDs set with xset.
FLAGS=$(xset -q | awk 'NR==2' | awk '{ print $10 }')
case $FLAGS in
  0000000?)
    xset led on
    ;;
  ffffe7f?)
    xset led off
    ;;
esac

