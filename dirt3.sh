#!/bin/bash
export WINEPREFIX="$HOME"/.dirt3/wine
if [ ! -d "$HOME"/.dirt3 ] ; then
   mkdir -p "$HOME"/.dirt3/wine
   wineboot -u
   winetricks dxvk
fi
cd /opt/dirt3
/usr/bin/wine dirt3_game.exe
