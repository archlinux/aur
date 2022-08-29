#!/bin/bash -e
GID=$(id -g)
readonly GID
readonly rootdir=/usr/lib/cemu
readonly datadir=${XDG_DATA_HOME:-$HOME/.local/share}/cemu
readonly statedir=${XDG_STATE_HOME:-$HOME/.local/state}/cemu
readonly mountpoint=${XDG_RUNTIME_DIR:-/tmp}/cemu
readonly cemu=$mountpoint/Cemu

mkdir -p "$datadir"/{gameProfiles/default,resources/sharedFonts,shaderCache} "$statedir" "$mountpoint"

# https://mostlyuseful.tech/posts/overlay-mounting/
exec unshare -rm bash -s -- "$@" <<- BASH
    mount -t overlay -o lowerdir="$rootdir" -o upperdir="$datadir" -o workdir="$statedir" -o userxattr overlay "$mountpoint"
    exec unshare --map-user=$UID --map-group=$GID --wd="$mountpoint" "$cemu" "\$@"
BASH
