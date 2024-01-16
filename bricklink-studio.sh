#!/bin/sh
pkgname=bricklink-studio
[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"
export WINEPREFIX="$XDG_DATA_HOME/$pkgname"
export WINEDLLOVERRIDES="mscoree,mshtml="

wine /usr/share/"$pkgname"/Studio.exe "$@"

