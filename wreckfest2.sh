#!/bin/bash
export WINEPREFIX="$HOME"/.wreckfest2/wine
if [ ! -d "$HOME"/.wreckfest2 ] ; then
   mkdir -p "$HOME"/.wreckfest2/wine
fi
cd /opt/wreckfest2
/usr/bin/umu-run Wreckfest2.exe
