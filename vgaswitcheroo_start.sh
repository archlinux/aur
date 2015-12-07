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

echo DIGD > /sys/kernel/debug/vgaswitcheroo/switch
echo OFF > /sys/kernel/debug/vgaswitcheroo/switch
