#!/bin/sh
pkgname=lsetwatch
[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"
export WINEPREFIX="$XDG_DATA_HOME/$pkgname"
export WINEDLLOVERRIDES="mshtml="

wine /usr/share/"$pkgname"/Lsetwatch.exe "$@"

