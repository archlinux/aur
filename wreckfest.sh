#!/bin/bash
export WINEPREFIX="$HOME"/.wreckfest/wine
if [ ! -d "$HOME"/.wreckfest ] ; then
   mkdir -p "$HOME"/.wreckfest/wine
   wineboot -u
   winetricks dxvk
fi
cd /opt/wreckfest
while getopts ":lmh" opt; do
  case ${opt} in
    l ) /usr/bin/wine Wreckfest.exe
      ;;
    m ) /usr/bin/wine Wreckfest_x64.exe
      ;;
    h ) echo "Usage: wreckfest [-l: legacy 32-bit Wreckfest.exe|-m: modern 64-bit Wreckfest_x64.exe (default)]"
      ;;
  esac
  exit
done
/usr/bin/wine Wreckfest_x64.exe
