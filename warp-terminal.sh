#!/bin/bash

# Make script fail fast on error
set -e

# Set default value if variable is unset/null
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

# Attempt to read a config file if it exists
if [ -r "${XDG_CONFIG_HOME}/warp-terminal-flags.conf" ]; then
	WARP_TERMINAL_USER_FLAGS="$(cat "$XDG_CONFIG_HOME/warp-terminal-flags.conf")"
fi

exec /opt/warpdotdev/warp-terminal/warp $WARP_TERMINAL_USER_FLAGS "$@"
