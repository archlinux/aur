#!/bin/bash
export WINEPREFIX="$HOME"/.dirtrally2/wine
if [ ! -d "$HOME"/.dirtrally2 ] ; then
   mkdir -p "$HOME"/.dirtrally2/wine
   wineboot -u
   winetricks dxvk
fi
cd /opt/dirtrally2
/usr/bin/wine dirtrally2.exe
