#!/bin/sh
pkgname=track-designer
[ -z "$XDG_DATA_HOME" ] && XDG_DATA_HOME="$HOME/.local/share"
export WINEPREFIX="$XDG_DATA_HOME/$pkgname"
export WINEDLLOVERRIDES=mscoree=d

# Track Designer loads Registry.tdr from the CWD,
# so need to execute TD.exe from there.
builtin cd /usr/share/"$pkgname"
wine TD.EXE "$@"