#!/bin/bash
export WINEPREFIX="$HOME"/.winbox/wine
export WINEARCH=win64
export WINEDLLOVERRIDES="mscoree=" # disable mono
export WINEDEBUG=-all
if [ ! -d "$HOME"/.winbox ] ; then
   mkdir -p "$HOME"/.winbox/wine
   wineboot -u
fi

wine /usr/share/winbox/winbox.exe "$@"
