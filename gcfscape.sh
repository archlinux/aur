#!/bin/bash

PKGNAME='gcfscape'
PKGPATH='/usr/share/gcfscape'
PKGBIN='x64/GCFScape.exe'

export WINEPREFIX="$HOME/.local/share/wineprefixes/$PKGNAME"
export WINEARCH='win64'
export WINEDEBUG=-all

wine $PKGPATH/$PKGBIN "${args[@]}"
