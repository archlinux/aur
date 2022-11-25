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
    _COL_BLUE_='\e[0;34m'
    _COL_DEFAULT_='\e[0m'
fi

# Check if postgres is running
if systemctl is-active postgresql -q ; then
    echo "Starting Karaoke Mugen..."
else
    echo -e "${_COL_YELLOW_}⚠️ Postgres seems down... Trying to start PostgreSQL before Karaoke Mugen.${_COL_DEFAULT_}"
    echo -e "${_COL_BLUE_}You may want to start PostgreSQL at boot with `systemctl enable postgresql`.${_COL_DEFAULT_}"
    systemctl start postgresql
fi
# Launch Karaoke Mugen
exec electron /usr/lib/karaokemugen/app.asar "$@"
