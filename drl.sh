#!/bin/bash

# DRL binary needs to run in a writable directory, along all other files.
# More info : https://github.com/chaosforgeorg/doomrl/blob/master/bin/unix_notes.txt

set -eu

personal="${XDG_DATA_HOME:-$HOME/.local/share}/drl"
sys=/usr/share/drl

[ -d "$personal" ] || mkdir -p "$personal" || exit 1

for f in backup mortem screenshot modules
do
	[ -f "$personal/$f" ] || cp -r "$sys/$f" "$personal"
done

for f in {colors,config,musichq,soundhq}.lua
do
	if [ "$sys/$f" -nt "$personal/$f" ]
	then
		echo "$sys/$f is newer than $personal/$f, replacing $personal/$f and keeping $f.old"
		[ -e "$personal/$f" ] && mv "$personal/$f"{,.old}
		cp "$sys/$f" "$personal/$f"
	fi
done

for f in drl {core,drl}.wad drl_{gnome-terminal,konsole,xterm} {manual,unix_notes,version_api,version}.txt mp3 wavhq
do
  [ -L "$personal/$f" ] || (rm -f "$personal/$f" && ln -s $sys/$f "$personal/$f")
done

pushd "$personal"
exec "$personal/drl" "$@"
