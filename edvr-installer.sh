#!/bin/sh
src=/usr/lib/edvr/edvr-installer.exe
dst=${XDG_CACHE_HOME:-$HOME/.cache}/edvr/edvr-installer.exe
if ! cmp -s "$src" "$dst"; then
    mkdir -p "${dst%/*}" && cp --reflink=auto "$src" "$dst.tmp" && mv "$dst.tmp" "$dst" || exit 1
fi
exec /usr/lib/edvr/edvr-installer-linux.py --installer "$dst" "$@"
