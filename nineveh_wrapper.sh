#!/bin/bash

/opt/loalogs/nineveh --stop-after-timeout 0 --proxy-without-ipc &
NINEVEH_PID=$!

while [ ! -f /tmp/nineveh-stop ]; do
    sleep 1
done

rm /tmp/nineveh-stop
kill $NINEVEH_PID
