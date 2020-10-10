#!/bin/bash
export PKGNAME=pkgname
export WINEPREFIX="$HOME"/.$PKGNAME
export WINEARCH=win32
export SOURCE=/usr/share/$PKGNAME
if [ ! -d "$WINEPREFIX" ] ; then
    winetricks winxp
    wineserver -w
    ln -s "$SOURCE"/Program\ Files/Adobe "$WINEPREFIX"/drive_c/Program\ Files/Adobe
    ln -s "$SOURCE"/Program\ Files/Common\ Files/Adobe "$WINEPREFIX"/drive_c/Program\ Files/Common\ Files/Adobe
    rm "$WINEPREFIX"/system.reg
    ln -s "$SOURCE"/system.reg "$WINEPREFIX"/system.reg
fi
WINEDEBUG=-all wine "$WINEPREFIX"/drive_c/Program\ Files/Adobe/Reader\ 11.0/Reader/AcroRd32.exe "$@"
