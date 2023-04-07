#!/usr/bin/env bash

declare -r CODE_BIN_PATH="/opt/code-translucent/bin/code-oss"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-~/.config}"
declare -r CODE_CONF_PATH="$XDG_CONFIG_HOME/code-flags.conf"

main() {

	[[ -e "${CODE_BIN_PATH}" ]] \
		|| { echo "'${CODE_BIN_PATH}' does not exist?!"; exit 1; }

	[[ -f "${CODE_CONF_PATH}" ]] \
		&& { local CODE_USER_FLAGS="$(sed 's/#.*//' $CODE_CONF_PATH | tr '\n' ' ')"; }

	[[ "${XDG_SESSION_TYPE}" == "wayland" ]] \
		&& { unset DISPLAY; exec "${CODE_BIN_PATH}" --enable-features=UseOzonePlatform --ozone-platform=wayland "$@" "${CODE_USER_FLAGS}"; } \
		|| { exec "${CODE_BIN_PATH}" "$@" "${CODE_USER_FLAGS}"; }

	exit 0;

}

main "$@"
