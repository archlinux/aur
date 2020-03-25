#!/usr/bin/env bash

#  _  __                  _         __  __
# | |/ /__ _ _ _ __ _ ___| |_____  |  \/  |_  _ __ _ ___ _ _
# | ' </ _` | '_/ _` / _ \ / / -_) | |\/| | || / _` / -_) ' \
# |_|\_\__,_|_| \__,_\___/_\_\___| |_|  |_|\_,_\__, \___|_||_|
#                                              |___/

# This script runs Karaoke Mugen app (with some check to avoid some disasters)
# From AUR package karaokemugen-git

# use colors only if we have them
if [[ $(which tput > /dev/null 2>&1 && tput -T "${TERM}" colors || echo -n '0') -ge 8 ]] ; then
    _COL_YELLOW_='\e[0;33m'
    _COL_LIGHTGREY_='\e[0;37m'
    _COL_BRED_='\e[1;31m'
    _COL_BBLUE_='\e[1;34m'
    _COL_BWHITE_='\e[1;37m'
    _COL_DEFAULT_='\e[0m'
fi

# Check if the user is in the karaokemugen group
if groups | grep -q '\bkaraokemugen\b'; then
    # Check if postgres is running
    if lsof -Pi :5432 -sTCP:LISTEN -t >/dev/null ; then
        echo "Starting Karaoke Mugen..."
    else
        echo -e "${_COL_YELLOW_}Postgres seems down... Trying to start Karaoke Mugen anyway."
    fi
    # Launch Karaoke Mugen
    cd /opt/karaokemugen/
    PORTABLE_EXECUTABLE_DIR=/opt/karaokemugen /opt/karaokemugen/karaokemugen
else
    echo -e "${_COL_BRED_}->${_COL_DEFAULT_} ${_COL_YELLOW_}WARNING:${_COL_DEFAULT_} You don't have the rights to access the Karaoke Mugen app"
    echo -e "${_COL_BBLUE_}You can grant yourself the access to Karaoke Mugen by executing the ${_COL_YELLOW_}\`karaokemugen-install -g\`${_COL_BBLUE_} command"
fi
