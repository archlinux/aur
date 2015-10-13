#!/bin/sh
export LANGUAGE=`echo $LANG | grep -oP [A-Za-z_]+ | head -1`

which sudo  2>&1 > /dev/null   &&  SUPER=sudo
which gksu  2>&1 > /dev/null   &&  SUPER=gksu
which kdesu 2>&1 > /dev/null   &&  SUPER=kdesu

if [ "$( ps -A | grep ucloner_gui)" ] ; then
    zenity --title="Error" --error --text="Another uclone instance is running!"
    exit 1
fi

cd /opt/ucloner/
exec $SUPER python2 ./ucloner_gui.py