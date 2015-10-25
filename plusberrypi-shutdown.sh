#!/bin/bash -e

echo 24 > /sys/class/gpio/export
echo in > /sys/class/gpio/gpio24/direction

trap "{ echo 24 > /sys/class/gpio/unexport; exit 0; }" TERM

while [ true ]
do
	if [ $(cat /sys/class/gpio/gpio24/value) == 0 ]
	then
		poweroff
		exit 0
	else
		sleep 1
	fi
done
