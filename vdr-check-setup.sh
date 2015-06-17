#!/bin/sh

cfg=/etc/vdr/channels.conf
if [ ! -s $cfg ] ; then
    logger -s -p daemon.err -t vdr.service \
        "$cfg is not valid, use \"scandvb -o vdr\" from the dvb-apps package to create one."
    exit 6
else
    chown vdr:vdr $cfg && chmod 644 $cfg
fi
