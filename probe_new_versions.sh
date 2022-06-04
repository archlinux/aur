#!/bin/bash

starting_version=276
current_windows_version=296

dl="https://drivers.amd.com/drivers/raid_linux_driver_930_00"
ref="https://www.amd.com/en/support/chipsets/amd-socket-strx4/trx40"

for (( i=$starting_version; i<=$current_windows_version; i++ )); do
	wget --referer $ref $dl$i.zip
done
