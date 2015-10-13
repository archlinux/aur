#!/bin/sh
export LANGUAGE=`echo $LANG | grep -oP [A-Za-z_]+ | head -1`

if [ "$( ps -A | grep ucloner_gui)" ] ; then
    zenity --title="Error" --error --text="Another uclone instance is running!"
    exit 1
fi

cd /opt/ucloner/

which sudo  && SUPER="sudo"
which gksu  && SUPER="gksu"
which kdesu && SUPER="kdesu"

case $SUPER in
"kdesu")
exec kdesu -c "python2 ./ucloner_gui.py"
;;
"gksu")
exec gksu python2 ./ucloner_gui.py
;;
"sudo")
exec sudo python2 ./ucloner_gui.py
;;
esac

