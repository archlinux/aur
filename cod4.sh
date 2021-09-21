#!/bin/bash
export WINEPREFIX="$HOME"/.cod4/wine
if [ ! -d "$HOME"/.cod4 ] ; then
   mkdir -p "$HOME"/.cod4/wine
   wineboot -u
fi
cd /opt/cod4
/usr/bin/wine iw3mp.exe
