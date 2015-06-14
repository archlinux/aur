#!/bin/bash
if [ "$(whoami)" != "root" ]
then
    echo "Must be ran as root"
    exit 1
fi

export UT2004_PATH="/opt/ut2004"

printf "Enter your Steam username:"
read steam_username
steamcmd +@sSteamCmdForcePlatformType windows +@ShutdownOnFailedCommand 1 +force_install_dir $UT2004_PATH +login $steam_username "+app_update 13230 validate" +quit
