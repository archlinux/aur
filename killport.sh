#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $(basename "$0") <port>"
    exit 1
fi

PORT=$1

PID=$(sudo lsof -t -i :"$PORT" 2>/dev/null)

if [ -z "$PID" ]; then
    echo "No process found listening on port $PORT"
    exit 1
fi

sudo kill -9 "$PID"
echo "Process with PID $PID listening on port $PORT has been force-killed."
