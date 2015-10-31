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

. /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh

# Make sure we run as root
if [[ $EUID -ne 0 ]]; then
   me="`dirname $0`/`basename $0`"
   ${SUDO} "${me}" ${@}
   exit 1
fi


### Information #################################################
DRIVERS=("${WIFI_DRIVERS[@]}")
NAME="Wifi"
NAME_SMALL="wlan"
ICON="gnome-dev-wavelan"
SYS_NAME="wlan"
COMMANDS_PRE_UP="${COMMANDS_WIFI_PRE_UP[@]}"
COMMANDS_PRE_DOWN="${COMMANDS_WIFI_PRE_DOWN[@]}"
COMMANDS_POST_UP="${COMMANDS_WIFI_POST_UP[@]}"
COMMANDS_POST_DOWN="${COMMANDS_WIFI_POST_DOWN[@]}"

# Get wifi interface
INTERFACE=$(/usr/sbin/iwconfig 2>/dev/null | grep ESSID | awk '{print $1}')

INTERFACE_UP="/sbin/ifconfig $INTERFACE up 2>/dev/null"
INTERFACE_DOWN="/sbin/ifconfig $INTERFACE down 2>/dev/null"


### Load saved state from file ##################################
load_saved_state

### Check rfkill switch #########################################
check_rfkill_switch

### Check /sys interface
check_sys_interface

### Detect if card is enabled or disabled #######################
detect_if_enabled


#################################################################
case $1 in
    "debug")
        print_generic_debug
    ;;
    "restore")
        device_restore
    ;;
    "off")
        device_off 1
    ;;
    "on")
        device_on 1
    ;;
    *)
        device_toggle
    ;;
esac

### End of file #################################################

