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
# Toggle between available displays using xrandr
#

. /etc/acpi/eeepc/acpi-eeepc-generic-functions.sh

xrandr=`which xrandr`
if [ ! -e "$xrandr" ]; then
    msg="Please install xorg-server-utils to be able
to use xrandr."
    eeepc_notify "$msg" display
    logger "$msg"
    echo "$msg"
    exit 0
fi

var_xrandr="$EEEPC_VAR/xrandr.log"
xrandr > $var_xrandr

current=$(grep -B 1 "*" $var_xrandr | head -n 1 | awk '{print ""$1""}')

connected=$(grep " connected " $var_xrandr | awk '{print ""$1""}')
disconnected=$(grep " disconnected " $var_xrandr | awk '{print ""$1""}')
all="$connected $disconnected"

name_lvds=$(grep -i connected $var_xrandr | grep -i lvds | awk '{print ""$1""}')
name_vga=""

if [ "x`echo $connected | grep -i VGA`" == "x" ]; then
    vga_connected="no"
else
    vga_connected="yes"
    name_vga=$(grep -i connected $var_xrandr | grep -i vga | awk '{print ""$1""}')
    vga_max_res=$(grep ${name_vga} -A 1 $var_xrandr | grep -v ${name_vga} | awk '{print ""$1""}')
fi
lvds_max_res=$(grep ${name_lvds} -A 1 $var_xrandr | grep -v ${name_lvds} | awk '{print ""$1""}')

# Define XRandR commands for each modes
xrandr_lvds="$xrandr --output ${name_lvds} --auto --output ${name_vga} --off"
xrandr_clone="$xrandr --output ${name_lvds} --auto --output ${name_vga} --auto"
xrandr_vga="$xrandr --output ${name_lvds} --off --output ${name_vga} --auto"
#xrandr_vga_and_lvds="$xrandr --output LVDS --auto --output ${name_vga} --auto --${COMMANDS_XRANDR_TOGGLE_VGA} ${name_lvds}"
xrandr_vga_and_lvds="$xrandr --auto --output ${name_vga} --mode ${vga_max_res} --${COMMANDS_XRANDR_TOGGLE_VGA} ${name_lvds}"

xrandr_lvds_name="Laptop screen only"
xrandr_clone_name="Clone"
xrandr_vga_name="VGA only"
xrandr_vga_and_lvds_name="VGA (${COMMANDS_XRANDR_TOGGLE_VGA/-/ }) laptop screen"


# Available modes and their name. Needs first to contain only LVDS.
modes=("${xrandr_lvds}" "${xrandr_lvds_name}")
# Now get the other available modes from the config file.
j=2
for ((i=0 ; i < ${#XRANDR_AVAILABLE_MODES[*]} ; i++)); do
    mode=${XRANDR_AVAILABLE_MODES[i]}
    case ${mode} in
        "clone")
            modes[j]="${xrandr_clone}"
            modes[j+1]="${xrandr_clone_name}"
            j=$(($j+2))
        ;;
        "vga")
            modes[j]="${xrandr_vga}"
            modes[j+1]="${xrandr_vga_name}"
            j=$(($j+2))
        ;;
        "both")
            modes[j]="${xrandr_vga_and_lvds}"
            modes[j+1]="${xrandr_vga_and_lvds_name}"
            j=$(($j+2))
        ;;
    esac
done


# Get the number of modes of LVDS
lvds_nb_modes=$((`sed -n '/LVDS/,//p' $var_xrandr | wc -l` - 1))
# What is the actual LVDS mode?
actual_mode_lvds=`sed -n '/LVDS/,//p' $var_xrandr | grep "*" | awk '{print ""$1""}'`
# Get the position of LVDS
position_lvds=(`grep ${name_lvds} $var_xrandr | awk '{print ""$3""}' | sed "s|[0-9]*x[0-9]*+\(.*\)+\(.*\)|\1 \2|g"`)

#################################################################
function get_mode_index() {
    detected_name="$1"
    detected_i=0
    for ((i=0 ; i < ${#modes[*]} ; i++)); do
        if [[ "${modes[i]}" == "${detected_name}" ]]; then
            detected_i=i
            break
        fi
    done
    # Name is detected. But we want the index of the mode command.
    echo $(($detected_i - 1))
}

# Assume we are actually at modes[0] (LVDS only)
m=0

# If VGA is connected, check its mode, its parameters, etc.
if [[ "$vga_connected" = "yes" ]]; then
    #echo "VGA connected. Trying to detect which configuration..."

    # Get the number of modes of VGA
    vga_nb_modes=$((`sed -n '/VGA/,/LVDS/p' $var_xrandr | wc -l` - 2))
    # What is the actual VGA mode?
    actual_mode_vga=`sed -n '/VGA/,/LVDS/p' $var_xrandr | grep "*" | awk '{print ""$1""}'`
    # Get the position of VGA
    position_vga=(`grep VGA $var_xrandr | awk '{print ""$3""}' | sed "s|[0-9]*x[0-9]*+\(.*\)+\(.*\)|\1 \2|g"`)

    # If the position is detected (and awk/sed of previous line does not
    # return a bogus value of '(normal'), detect which mode we actually use.
    if [ "${position_vga}" != "(normal" ]; then
        # Detect if we are at mode clone
        if   [[ \
                "${position_lvds[0]}" == "0" && \
                "${position_lvds[1]}" == "0" && \
                "${position_vga[0]}"  == "0" && \
                "${position_vga[1]}"  == "0" ]]; then
            m=`get_mode_index "${xrandr_clone_name}"`
        # Detect if we are at mode VGA only
        elif [ "${position_lvds}" == "(normal" ]; then
            m=`get_mode_index "${xrandr_vga_name}"`
        # Detect if we are at mode VGA + LVDS
        else
            m=`get_mode_index "${xrandr_vga_and_lvds_name}"`
        fi
        m=$(($m/2))
    fi
fi

#################################################################
function display_toggle() {
    mc=$(($m*2))            # Index of mode's command
    mn=$(($m*2 + 1))        # Index of mode's name
    prev_mc=$(($m*2))       # Index of (previous) mode's command
    prev_mn=$(($m*2 + 1))   # Index of (previous) mode's name
    echo "Actual mode is ${modes[$mn]} (m=$m)"

    if [ "$1" == "" ]; then
        # We are at mode "m", go to next mode
        m=$(($m + 1))
        mc=$((mc + 2))
        # Check for round-up
        if [ "$mc" == "${#modes[*]}" ]; then
            m=0
            mc=0
        fi
    else
        echo "Called with: $1"
        m=$((`get_mode_index "$1"`/2))
        mc=$(($m*2))
    fi
    mn=$(($mc + 1))

    echo "Next mode will be ${modes[$mn]} (m=$m)"

    xrandr_cmd="${modes[$mc]}"
    echo "xrandr_cmd = ${xrandr_cmd}"
#     return

    if [ "${prev_mc}" == "${mc}" ]; then
        eeepc_notify "Display already in '${modes[$mn]}' mode" video-display
        return
    fi

    # If next mode is 0 (LVDS only), we really want to go there,
    # whatever the state of the VGA is.
    if [ "$m" == "0" ]; then
        eeepc_notify "Changing display mode to: ${modes[$mn]}" video-display 10000
        execute_commands "${xrandr_cmd}"
    else
        # Else, we check if VGA is connected: it does not make sense
        # to activate it if it's not present.
        if [ "$vga_connected" == "yes" ]; then
            eeepc_notify "Changing display mode to '${modes[$mn]}' mode" video-display 10000
            execute_commands "${xrandr_cmd}"
        else
            # If VGA is not connected, don't do anything
            eeepc_notify "VGA not connected: not going to '${modes[$mn]}' mode" video-display
            return
        fi
    fi

}

#################################################################
function display_debug() {
    echo "Modes (${#modes[*]}):"
    for ((i=0 ; i < ${#modes[*]} ; i=i+2)); do
        echo "${modes[i+1]}: ${modes[i]}"
    done

    echo "All: ${all}"
    echo "Connected: ${connected}"
    echo "Disconnected: ${disconnected}"
    echo "vga_connected = $vga_connected"
    echo "current = $current"

    echo "vga_nb_modes = $vga_nb_modes"
    echo "lvds_nb_modes = $lvds_nb_modes"
    echo "actual_mode_vga = $actual_mode_vga"
    echo "actual_mode_lvds = $actual_mode_lvds"

    echo "position_lvds = ${position_lvds[*]}"
    echo "position_vga = ${position_vga[*]}"

    xrandr

    exit
}

#################################################################
case $1 in
    lvds|Lvds|LVDS)
        display_toggle "${xrandr_lvds_name}"
    ;;
    clone|Clone|CLONE)
        display_toggle "${xrandr_clone_name}"
    ;;
    vga|Vga|VGA)
        display_toggle "${xrandr_vga_name}"
    ;;
    vga_and_lvds|both|Both|BOTH)
        display_toggle "${xrandr_vga_and_lvds_name}"
    ;;
    debug|Debug|DEBUG)
        display_debug
    ;;
    *)
        display_toggle
    ;;
esac

### End of file #################################################
