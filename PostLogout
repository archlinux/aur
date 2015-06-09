#!/bin/sh

# Kills all your processes when you log out.
ps --user $USER | awk 'NR > 1 {print $1}' | xargs -t kill

# Sets the desktop background to solid black. Useful if you have multiple monitors.
xsetroot -solid black
