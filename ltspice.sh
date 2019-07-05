#!/bin/bash
if [ ! -d "$HOME"/.ltspice ] ; then
   mkdir -p "$HOME"/.ltspice
   touch "$HOME"/.ltspice/LTspiceXVII.ini
fi
export WINEPREFIX=$HOME/.ltspice/env
wine /usr/share/ltspice/XVIIx64 -ini "$HOME"/.ltspice/LTspiceXVII.ini "$@"
