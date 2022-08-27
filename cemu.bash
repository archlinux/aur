#!/bin/bash -e
GID=$(id -g)
readonly GID
readonly rootdir=/usr/lib/cemu
readonly datadir=${XDG_DATA_HOME:-$HOME/.local/share}/cemu
readonly statedir=${XDG_STATE_HOME:-$HOME/.local/state}/cemu
readonly mountpoint=${XDG_RUNTIME_DIR:-/tmp}/cemu
readonly cemu=$mountpoint/Cemu

mkdir -p "$datadir" "$statedir" "$mountpoint"

exec unshare -rm bash <<- BASH
    mount -t overlay -o lowerdir="$rootdir" -o upperdir="$datadir" -o workdir="$statedir" -o userxattr overlay "$mountpoint"
    exec unshare --map-user=$UID --map-group="$GID" "$cemu" "$@"
BASH
