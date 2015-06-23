#!/bin/sh

SVDRPSEND="/usr/lib/vdr/svdrpsend.pl"
CHANNEL_NUM=1
CHANNEL_NUM_BEFOR=`$SVDRPSEND -d 127.0.0.1 chan | grep "250 " | cut -d" " -f2`
$SVDRPSEND -d 127.0.0.1 chan $CHANNEL_NUM
$SVDRPSEND -d 127.0.0.1 PLUG sc reload
$SVDRPSEND -d 127.0.0.1 chan $CHANNEL_NUM_BEFOR
$SVDRPSEND -d 127.0.0.1 MESG "Softcam.Key reloaded.."
