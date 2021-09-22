#!/bin/bash
export WINEPREFIX="$HOME"/.codwaw/wine
if [ ! -d "$HOME"/.codwaw ] ; then
   mkdir -p "$HOME"/.codwaw/wine
   wineboot -u
fi
cd /opt/codwaw
while getopts ":szmh" opt; do
  case ${opt} in
    s ) /usr/bin/wine CoDWaW.exe
      ;;
    z ) /usr/bin/wine CoDWaW.exe
      ;;
    m ) /usr/bin/wine CoDWaWmp.exe
      ;;
    h ) echo "Usage: codwaw [-z: zombies/singleplayer CoDWaW.exe (default)|-m: multiplayer CoDWaWmp.exe]"
      ;;
  esac
  exit
done
/usr/bin/wine CoDWaW.exe
