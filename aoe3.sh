#!/bin/bash
export WINEPREFIX="$HOME"/.aoe3/wine
if [ ! -d "$HOME"/.aoe3 ] ; then
   mkdir -p "$HOME"/.aoe3/wine
   wineboot -u
   # vcrun6 fails to install; still fixing audio
   winetricks corefonts d9vk quartz mfc42 l3codecx msxml4 riched20
fi
cd /opt/aoe3
while getopts ":oxy" opt; do
  case ${opt} in
    o ) /usr/bin/wine age3.exe
      ;;
    x ) /usr/bin/wine age3x.exe
      ;;
    y ) /usr/bin/wine age3y.exe
      ;;
    h ) echo "Usage: aoe3 [-o: original age3.exe|-x warchiefs age3x.exe|-y asiandynasties age3y.exe (default)]"
      ;;
  esac
  exit
done
/usr/bin/wine age3y.exe
