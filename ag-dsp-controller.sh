#!/bin/bash

export WINEPREFIX="$HOME"/.ag-dsp-controller/wine
export WINEARCH=win32
export WINEDEBUG=-all
export WINEDLLOVERRIDES=mscoree=d

if [ ! -d "$HOME"/.ag-dsp-controller ] ; then
   mkdir -p "$HOME"/.ag-dsp-controller/wine
   wineboot -u
fi

wine /usr/share/ag-dsp-controller/ag_dsp_controller.exe "$@"
