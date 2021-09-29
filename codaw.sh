#!/bin/bash
export WINEPREFIX="$HOME"/.codaw/wine
if [ ! -d "$HOME"/.codaw ] ; then
   mkdir -p "$HOME"/.codaw/wine
   wineboot -u
   winetricks dxvk
fi
cd /opt/codaw
while getopts ":dszmh" opt; do
  case ${opt} in
    d ) /usr/bin/wine s1x.exe -dedicated
      ;;
    s ) /usr/bin/wine s1x.exe -survival
      ;;
    z ) /usr/bin/wine s1x.exe -zombies
      ;;
    m ) /usr/bin/wine s1x.exe -multiplayer
      ;;
    h ) echo "Usage: codaw [-z: zombies|-m: multiplayer (default)|-s: survival|-d: dedicated]"
      ;;
  esac
  exit
done
/usr/bin/wine s1x.exe -multiplayer
