#!/bin/bash
export WINEPREFIX="$HOME"/.booktab/wine
#export WINE_LARGE_ADDRESS_AWARE=1
if [ ! -d "$HOME"/.booktab ] ; then
   mkdir -p "$HOME"/.booktab/wine
   wineboot -u
fi
cd /opt/booktab
/usr/bin/wine BooktabZ.exe
