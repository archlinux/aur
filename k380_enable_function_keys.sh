#!/usr/bin/sh

if [ "$ACTION" == "add" ];
then
    /usr/bin/k380_conf -d $DEVNAME -f on
fi
