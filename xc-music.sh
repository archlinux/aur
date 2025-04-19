#!/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

if [[ -f "${XDG_CONFIG_HOME}/xcmusic-flags.conf" ]]; then
	mapfile -t XCMUSIC_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/xcmusic-flags.conf")"
	echo "User flags:" ${XCMUSIC_USER_FLAGS[@]}
fi


exec /usr/lib/xc-music/xc-music ${XCMUSIC_USER_FLAGS[@]} "$@"
