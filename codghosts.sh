#!/bin/bash
export WINEPREFIX="$HOME"/.codghosts/wine
if [ ! -d "$HOME"/.codghosts ] ; then
   mkdir -p "$HOME"/.codghosts/wine
   wineboot -u
   winetricks dxvk
fi
cd /opt/codghosts
while getopts ":dmh" opt; do
  case ${opt} in
    d ) /usr/bin/wine iw6x.exe -dedicated
      ;;
    m ) /usr/bin/wine iw6x.exe -multiplayer
      ;;
    h ) echo "Usage: codaw [-m: multiplayer (default)|-d: dedicated]"
      ;;
  esac
  exit
done
/usr/bin/wine iw6x.exe -multiplayer
