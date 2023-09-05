#!/usr/bin/bash

echo "Starting..."
echo "Device: ${device}"
echo "Scanner: ${scanner}"
echo "Server: ${server}"

while [ true ]
do
pidof "$scanner"
status="$?"

if [ $status -eq 0 ]
then
hass-cli --server ${server} state turn_on ${device}
fi

sleep 5

done
