#!/bin/sh

CONFIGDIR="${XDG_DATA_HOME:-"$HOME/.config"}/phantomsocks"

if [ "$(id -u)" = "0" ]; then
        echo "Please do not run this script as root!"
        exit 1
fi

if [ ! -d "$CONFIGDIR" ] || [ ! -e "$CONFIGDIR/config.json" ]; then
    mkdir -p "$CONFIGDIR"
    cp -rn /usr/share/phantomsocks/*.* "$CONFIGDIR"
fi

cd "$CONFIGDIR" || exit 1
exec phantomsocks "$@"