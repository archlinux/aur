#!/bin/bash
declare -a args

# Fix whatpulse bypassing wrapper script on startup
AUTOSTART="${XDG_CONFIG_HOME:-$HOME/.config}/autostart/whatpulse.desktop"
if [[ -w "${AUTOSTART}" ]]; then
	sed -i 's;lib/whatpulse;bin;' "${AUTOSTART}"
	chmod 400 "${AUTOSTART}"
fi

until (($# == 0)); do
	if [[ $1 =~ ^-[^-] ]]; then
		args+=("-$1")
	else
		args+=("$1")
	fi
	shift
done

exec -a "$0" /usr/lib/whatpulse/whatpulse "${args[@]}"
