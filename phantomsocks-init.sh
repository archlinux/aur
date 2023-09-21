#!/bin/sh

CONFIGFILE="config.json"
CONFIGDIR="${XDG_DATA_HOME:-"$HOME/.config"}/phantomsocks"

if [ "$(id -u)" = "0" ]; then
        echo "Please do not run this script as root!"
        exit 1
fi

if [ ! -d "$CONFIGDIR" ] || [ ! -e "$CONFIGDIR/$CONFIGFILE" ]; then
    mkdir -p "$CONFIGDIR" && \
    cp -rn /usr/share/phantomsocks/*.* "$CONFIGDIR"
fi

cd "$CONFIGDIR" || exit 1

active_interfaces=$(ip addr show | awk '/inet.*brd/{print $NF}')
select_interfaces=$(ip addr show | awk '/inet.*brd/{print $NF; exit}')

jq --arg active_interfaces "$active_interfaces" \
   --arg select_interfaces "$select_interfaces" '

def validatePface(dev):
    if dev != null then
        if (dev | inside($active_interfaces) | not) or (dev == "") then
            dev = $select_interfaces
        end
    end ;

.services[] |= validatePface(.device) |
.interfaces[] |= validatePface(.device)

' "$CONFIGDIR/$CONFIGFILE" > "$XDG_RUNTIME_DIR/$CONFIGFILE.tmp" \
&& mv "$XDG_RUNTIME_DIR/$CONFIGFILE.tmp" "$CONFIGDIR/$CONFIGFILE"

exec phantomsocks "$@"