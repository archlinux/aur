#!/usr/bin/bash
# without this, server exits suddenly due to systemd killing wrong pid (wine pid, not vrising)
PID=$(pgrep -f '^Z:\\opt\\vrising-server\\VRisingServer.exe')
echo "Stopping PID: $PID"
kill -SIGINT $PID

# systemd will eventually kill this if it doesnt work after 90s
while true; do
    sleep 1
    PID=$(pgrep -f '^Z:\\opt\\vrising-server\\VRisingServer.exe')
    if [ -z "$PID" ]; then
        echo "Process successfully stopped gracefully"
        echo "Killing any leftover wine processes"
        wineserver -k
        sleep 1
        exit
    fi
    sleep 1
done
