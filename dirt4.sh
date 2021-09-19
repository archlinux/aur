#!/bin/bash
export WINEPREFIX="$HOME"/.dirt4/wine
if [ ! -d "$HOME"/.dirt4 ] ; then
   mkdir -p "$HOME"/.dirt4/wine
   wineboot -u
   winetricks dxvk
fi
cd /opt/dirt4
/usr/bin/wine dirt4.exe
