#!/bin/bash
unset WINEPREFIX
if [ -z "$XDG_DATA_DIR" ]; then
	XDG_DATA_DIR="$HOME/.local/share"
fi
if [ ! -d "$XDG_DATA_DIR/rexpaint" ]; then
	if [ -z "$RP_INSTALL_DIR" ]; then
		RP_INSTALL_DIR="/usr/share/rexpaint"
	fi
	mkdir -p "$XDG_DATA_DIR/rexpaint"
	cd "$XDG_DATA_DIR/rexpaint"
	ln -s "$RP_INSTALL_DIR/REXPaint.exe"
	ln -s "$RP_INSTALL_DIR"/*.dll .
	ln -s "$RP_INSTALL_DIR/rex"
	cp -r "$RP_INSTALL_DIR/images" .
	cp -r "$RP_INSTALL_DIR/data" .
fi
cd "$XDG_DATA_DIR/rexpaint"
WINEDLLOVERRIDES="mshtml,mscoree=" WINEDEBUG=-all wine "$XDG_DATA_DIR/rexpaint/REXPaint.exe" "$@"
