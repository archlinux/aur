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
DRIVERS=()
NAME="Super Hybrid Engine"
NAME_SMALL="she"
ICON="cpu"
SYS_NAME="cpufv"
COMMANDS_PRE_UP=""
COMMANDS_PRE_DOWN=""
COMMANDS_POST_UP=""
COMMANDS_POST_DOWN=""


### Load saved state from file ##################################
load_saved_state

### Check /sys interface ########################################
check_sys_interface

### Detect if card is enabled or disabled #######################
detect_if_enabled

### Toggle Super Hybrid Engine ##################################
# To test: ./c_speedtest -nsize 1000000 -niters 10 > 0x302_2_powersave.log
she_names=("performance" "normal" "powersave")
she_value_performance=("0" "0x300") # 768
she_value_normal=(     "1" "0x301") # 769
she_value_powersave=(  "2" "0x302") # 770

# Find current
she_current=`cat ${SYS_DEVICE}`

if   [[ "${she_current}" == "${she_value_performance[1]}" ]]; then
    she_next=${she_value_normal[0]}
elif [[ "${she_current}" == "${she_value_normal[1]}" ]]; then
    she_next=${she_value_powersave[0]}
elif [[ "${she_current}" == "${she_value_powersave[1]}" ]]; then
    she_next=${she_value_performance[0]}
fi

function she_toggle() {
    if [[ "${she_names[${she_current/0x30/}]}" != "${she_names[${she_next}]}" ]]; then
        eeepc_notify "Super Hybrid Engine: Changing to ${she_names[${she_next}]}" cpu
        echo ${she_next} > ${SYS_DEVICE} && eeepc_notify "Super Hybrid Engine: ${she_names[${she_current/0x30/}]} to ${she_names[${she_next}]}" cpu &
    else
        eeepc_notify "Super Hybrid Engine: Already at ${she_names[${she_next}]}" cpu
    fi
}

#################################################################
case $1 in
    "debug")
        print_generic_debug
    ;;
    "powersave")
        she_next=2
        she_toggle
    ;;
    "normal")
        she_next=1
        she_toggle
    ;;
    "performance")
        she_next=0
        she_toggle
    ;;
    *)
        she_toggle
    ;;
esac

### End of file #################################################

