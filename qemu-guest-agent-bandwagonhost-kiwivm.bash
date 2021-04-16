#!/bin/bash
SERIALSTDIO=/dev/virtio-ports/kiwicomm.port0
SERIALSTDERR=/dev/virtio-ports/kiwicomm.port1

if [ ! -L "$SERIALSTDIO" ] || [ ! -L "$SERIALSTDERR" ]; then
        echo "Serial device not found, aborting."
        exit 1
fi

(
flock -x -w 3 188 || { exit 0; }

while true; do
        line=""
        read -r line < $SERIALSTDIO
        if [ ! -z "$line" ]; then
                echo $line
                eval $line > $SERIALSTDIO 2>$SERIALSTDERR
                echo "EXIT CODE: $?" >$SERIALSTDERR
        else
                sleep 1
        fi
done
) 188> /var/lock/qemu-guest-agent-bandwagonhost-kiwivm.lock
