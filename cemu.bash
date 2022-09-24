#!/bin/bash
GID=$(id -g)
readonly GID

# https://github.com/cemu-project/Cemu/issues/173
export LC_ALL=C
unset LANGUAGE

# https://mostlyuseful.tech/posts/overlay-mounting/
exec unshare -rm bash -es -- \
	"${XDG_DATA_HOME:-$HOME/.local/share}" \
	"${XDG_RUNTIME_DIR:-/tmp}" \
	"${XDG_CACHE_HOME:-$HOME/.cache}" \
	"$@" <<- BASH
		readonly data=\$1/cemu
		readonly overlay=\$2/cemu
		readonly tmp=\$3/cemu

		shift 3

		mkdir -p "\$data"/{gameProfiles/default,resources/sharedFonts,shaderCache} "\$overlay" "\$tmp"

		mount -t overlay -o lowerdir=/usr/lib/cemu -o upperdir="\$data" -o workdir="\$tmp" -o userxattr overlay "\$overlay"
		exec unshare --map-user=$UID --map-group=$GID --wd="\$overlay" ./Cemu "\$@"
	BASH
