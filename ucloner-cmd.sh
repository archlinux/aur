#!/bin/sh
export LANGUAGE=`echo $LANG | grep -oP [A-Za-z_]+ | head -1`
cd /opt/ucloner/
exec sudo python2 ./ucloner_cmd.py "$@"


