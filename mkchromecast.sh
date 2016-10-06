#!/bin/bash

if [ $# -ge 1 ]
then
    python /usr/share/mkchromecast/mkchromecast.py "$@"
else
    python /usr/share/mkchromecast/mkchromecast.py

fi
exit 0


