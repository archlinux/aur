#! /bin/sh

i=1
while [ ! -e /sys/kernel/debug/vgaswitcheroo/switch ]
do
    sleep 1
    i=$(( $i + 1 ))
    if [ "$i" -eq "10" ] 
    then 
	exit ;
    fi
done

if [ "$(check_active_gpu.sh)" == "IGD" ]; then
	echo DIGD > /sys/kernel/debug/vgaswitcheroo/switch
	echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
fi
	
