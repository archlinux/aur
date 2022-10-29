#!/bin/sh

NAME='th10'
SRC="/usr/share/$NAME"
DEST="$HOME/.local/share/$NAME"

export WINEPREFIX="$DEST/wine"
export WINEDLLOVERRIDES='mscoree,mshtml='
export WINEARCH='win32'
export LANG='ja_JP.UTF-8'

if [ -e "$DEST/custom.exe" ]; then
	cd "$DEST"
	wine custom.exe
else
	echo No custom.exe found
fi

