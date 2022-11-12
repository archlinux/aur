#!/bin/sh

DATE_TIME="$(date +'%F.%u %_H:%M')"
DATE="${DATE_TIME%% *}"
TIME="${DATE_TIME##* }"
HOUR="${TIME%%:*}"
MINUTE="${TIME##*:}"

LINE="$(($HOUR + 1))"

LOGDIR="/var/log/usage"
LOGFILE="$LOGDIR/$DATE"

[ -d "$LOGDIR" ] || mkdir -p -- "$LOGDIR"

[ -f "$LOGFILE" ] ||
    dd if=/dev/zero bs=1 count=$((24*60)) 2> /dev/null | tr '\0' '.' | fold -w 60 > "$LOGFILE"

sed -i -E "${LINE}s/^(.{$MINUTE})./\1#/" "$LOGFILE"

