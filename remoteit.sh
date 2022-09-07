#!/bin/sh

. /usr/share/remoteit/functions.sh
. /usr/share/remoteit/oem.sh
REMOTEIT_DIR=/usr/share/remoteit
PIDFILE=/var/run/remoteit-$1.pid

config=$(r3_get_config $1)

[ -n "$config" ] || (r3_stop_service remoteit $1 && exit 0)

[ -n "$config" ] && exec "$REMOTEIT_DIR/connectd" -d $PIDFILE -e "$config"
