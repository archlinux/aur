#!/bin/sh
set -e

datadir="/usr/share/arculator"
userdir="${XDG_DATA_HOME:-$HOME/.local/share}/arculator"

if [ ! -e "$userdir/arculator" ]; then
	mkdir -p "$userdir"
	cp -a "$datadir"/. "$userdir"/
fi

cd "$userdir"
exec ./arculator "$@"
