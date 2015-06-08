#!/bin/sh
#Simple script to start iwscanner

GKSU=/usr/bin/gksu
KDESU=/usr/bin/kdesu
GKSUDO=/usr/bin/gksudo

if [ -e "$GKSU" ]
   then
   $GKSU /usr/share/iwscanner/iwscanner.py
elif [ -e "$KDESU" ]
   then
   $KDESU -c /usr/share/iwscanner/iwscanner.py
elif [ -e "$GKSUDO" ]
   then
   $GKSUDO -c /usr/share/iwscanner/iwscanner.py
else
   echo "Unable to find suitable su application, please install gksu"
fi
