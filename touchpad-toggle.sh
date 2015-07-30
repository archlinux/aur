#!/bin/bash

# Script to toggle the touchpad
# See https://wiki.archlinux.org/index.php/Touchpad_Synaptics#Software_toggle
# Use desktop environment to set keyboard shortcut.

synclient TouchpadOff=$(synclient -l | grep -c 'TouchpadOff.*=.*0')
