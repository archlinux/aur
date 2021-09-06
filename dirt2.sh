#!/bin/bash
export WINEPREFIX="$HOME"/.dirt2/wine
if [ ! -d "$HOME"/.dirt2 ] ; then
   mkdir -p "$HOME"/.dirt2/wine
   wineboot -u
fi
cd /opt/dirt2
/usr/bin/wine dirt2.exe
