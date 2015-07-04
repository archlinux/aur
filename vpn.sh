#!/bin/sh
if [ "$1" == "pre" ]
then
  killall openvpn
fi
