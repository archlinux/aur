#!/bin/bash

rm -f /tmp/nineveh-stop

pkexec /opt/loalogs/nineveh_wrapper.sh &

echo "Waiting for nineveh backend to start..."
while ! pgrep -x "nineveh" > /dev/null; do
    sleep 0.5
done

sleep 1

/opt/loalogs/loalogs.appimage

touch /tmp/nineveh-stop
