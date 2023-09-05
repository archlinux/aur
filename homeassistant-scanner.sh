#!/usr/bin/bash

echo "Starting..."
echo "Device: ${device}"
echo "Scanner: ${scanner}"
echo "Server: ${server}"

while [ true ]
do
queue="$(lpq -P ${printer})"
echo "$queue" | grep -q -- "no entries"
status="$?"

if [ $status -ne 0 ]
then
hass-cli --server ${server} state turn_on ${device}
fi

sleep 5

done
