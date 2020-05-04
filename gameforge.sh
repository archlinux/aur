#!/bin/bash
export WINEPREFIX="$HOME/.gameforge/wine"
export WINEARCH=win32
export WINEESYNC=1

if [ ! -f "$HOME"/.gameforge/wine/drive_c/windows/system32/vcruntime140.dll ]; then
  if [ -n "`whereis zenity|grep bin`" ]; then
    zenity --info  --title 'Game Forge' --text 'Installing wine dependencies.\n\nThe process may take a few minutes'
  fi
  winetricks -q vcrun2019
  winetricks settings win10
fi
cd $HOME/.gameforge/wine/drive_c/Program\ Files/

if [ ! -f GameforgeClient/gfclient.exe ]; then
	/usr/lib32/wine/fakedlls/ninewinecfg.exe
	wine $HOME/.gameforge/wine/GameForgeInstaller.exe
fi
wine GameforgeClient/gfclient.exe "$@"
