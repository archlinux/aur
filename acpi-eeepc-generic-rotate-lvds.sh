#!/bin/bash
# Copyright 2009 Nicolas Bigaouette
# This file is part of acpi-eeepc-generic.
# http://code.google.com/p/acpi-eeepc-generic/
#
# acpi-eeepc-generic is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# acpi-eeepc-generic is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with acpi-eeepc-generic.  If not, see <http://www.gnu.org/licenses/>.
#
# LVDS Rotate
# Andrew Wyatt
# Tool to rotate LVDS panel
#

. /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh

var_xrandr="$EEEPC_VAR/xrandr.log"
xrandr > $var_xrandr

name_lvds=$(grep -i connected $var_xrandr | grep -i lvds | awk '{print ""$1""}')

function rotate_toggle {
  CURRENT=`xrandr  | grep LVDS | awk '{print $4}'`
  if [ "$CURRENT" = "right" ]; then
    ROTATION="inverted"
  elif [ "$CURRENT" = "inverted" ]; then
    ROTATION="left"
  elif [ "$CURRENT" = "left" ]; then
    ROTATION="normal"
  else
    ROTATION="right"
  fi
  if [ "$ROTATION" ]; then
    rotate_lvds "$ROTATION"
    echo "$ROTATION" > $EEEPC_VAR/rotation_saved
  fi
}

function restore_rotation {
  if [ -e "$EEEPC_VAR/rotation_saved" ]; then
    ROTATION=$(cat $EEEPC_VAR/rotation_saved)
    rotate_lvds "$ROTATION"
  fi
}

function rotate_lvds {
    eeepc_notify "Rotate LCD \"$1\"" screen
    xrandr --output ${name_lvds} --rotate "$1"
}

case $1 in
  inverted)
    rotate_lvds inverted
  ;;
  left)
    rotate_lvds left
  ;;
  right)
    rotate_lvds right
  ;;
  normal)
    rotate_lvds normal
  ;;
  restore)
    restore_rotation
  ;;
  *)
    rotate_toggle
  ;;
esac

