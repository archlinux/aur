#!/bin/bash
unset WINEPREFIX
if [ ! -d "$HOME"/.ltspice ] ; then
   mkdir -p "$HOME"/.ltspice
   touch "$HOME"/.ltspice/LTspiceXVII.ini
fi
wine /usr/share/ltspice/XVIIx64 -ini "$HOME"/.ltspice/LTspiceXVII.ini "$@"
