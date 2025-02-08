#!/usr/bin/bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f "${XDG_CONFIG_HOME}/mihomo-purity-flags.conf" ]]; then
	mapfile -t MIHOMO_PURITY_USER_FLAGS <<<"$(grep -v '^#' "${XDG_CONFIG_HOME}/mihomo-purity-flags.conf")"
	echo "User flags:" ${MIHOMO_PURITY_USER_FLAGS[@]}
fi

# Launch
exec electron /opt/mihomo-purity ${MIHOMO_PURITY_USER_FLAGS[@]} "$@"
