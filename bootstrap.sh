#!/bin/sh
readonly pkgname=cemu
readonly lib=/usr/lib/$pkgname
readonly data=${XDG_DATA_HOME:-$HOME/.local/share}/$pkgname
readonly state=${XDG_STATE_HOME:-$HOME/.local/state}/$pkgname
readonly overlay=${XDG_RUNTIME_DIR:-/tmp}/$pkgname

install -d "$data" "$overlay" "$state"

mount -t overlay -o "upperdir=$data,lowerdir=$lib,workdir=$state" overlay "$overlay"

exec unshare -U "$overlay"/Cemu "$@"
