#!/bin/bash
export WINEPREFIX="$HOME"/.aoe3/wine
if [ ! -d "$HOME"/.aoe3 ] ; then
   mkdir -p "$HOME"/.aoe3/wine
   wineboot -u
   winetricks courier mfc42 d9vk
fi
cd /opt/aoe3
while getopts ":oxyh" opt; do
  case ${opt} in
    o ) /usr/bin/wine age3.exe +noIntroCinematics
      ;;
    x ) /usr/bin/wine age3x.exe +noIntroCinematics
      ;;
    y ) /usr/bin/wine age3y.exe +noIntroCinematics
      ;;
    h ) echo "Usage: aoe3 [-o: original age3.exe|-x warchiefs age3x.exe|-y asiandynasties age3y.exe (default)]"
      ;;
  esac
  exit
done
/usr/bin/wine age3y.exe +noIntroCinematics
