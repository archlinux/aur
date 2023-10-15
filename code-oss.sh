#!/usr/bin/env bash

shopt -s nocasematch

declare -r CODE_BIN_PATH="/opt/code-translucent/bin/code-oss"
declare -r XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
declare -r CODE_CONF_PATH="${XDG_CONFIG_HOME}/code-flags.conf"

in_array() {

	local -n array=$1
	local -r pattern=$2

	for value in "${array[@]}"; do
		[[ "${value}" =~ $pattern ]] \
			&& return 0
	done

	return 1

}

is_wayland() {

	[[ "${XDG_SESSION_TYPE}" == "wayland" ]] \
		&& return 0

	[[ -n "${WAYLAND_DISPLAY}" ]] \
		&& return 0

	return 1

}

main() {

	local -a CODE_USER_FLAGS=()

	[[ -e "${CODE_BIN_PATH}" ]] \
		|| { echo "'${CODE_BIN_PATH}' does not exist?!"; exit 1; }

	[[ -f "${CODE_CONF_PATH}" ]] \
		&& { mapfile -t CODE_USER_FLAGS <<< "$(sed 's/#.*//' ${CODE_CONF_PATH})"; }

	is_wayland && {

		in_array CODE_USER_FLAGS '^--ozone-platform=wayland$' \
			|| CODE_USER_FLAGS+=('--ozone-platform=wayland')

		in_array CODE_USER_FLAGS '^--enable-features=.*UseOzonePlatform' \
			|| CODE_USER_FLAGS+=('--enable-features=UseOzonePlatform')

	}

	exec "${CODE_BIN_PATH}" "$@" "${CODE_USER_FLAGS[@]}"

	exit 0

}

main "$@"
