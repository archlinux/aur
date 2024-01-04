#!/usr/bin/env bash

set -eo pipefail

declare -a flags


[[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/@PKGNAME@.conf" ]] && source "${XDG_CONFIG_HOME:-$HOME/.config}/@PKGNAME@.conf"

flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/@PKGNAME@-flags.conf"
krisp_bin="${XDG_CONFIG_HOME:-$HOME/.config}/@PKGNAME@/@PKGVER@/modules/@PKGNAME@_krisp/@PKGNAME@_krisp.node"
krisp_b2=@KRISPB2@

if hash rizin &> /dev/null && [[ "${PATCH_KRISP}" == true ]]; then
	# Patch Krisp binary to ignore signature check
	if [[ -w "${krisp_bin}" && $(b2sum "${krisp_bin}" | head -c 128) == $krisp_b2 ]]; then
		addr=$(rz-find -x '4881ec00010000' "${krisp_bin}" | head -n1)
		rizin -q -w -c "s $addr + 0x30 ; wao nop" "${krisp_bin}" &> /dev/null
	fi
fi

if [[ -r "${flags_file}" ]]; then
	# Replacing because old flag does not work
	if [[ -w "${flags_file}" ]] && grep -q '\--ignore-gpu-blacklist' "${flags_file}"; then
		sed -i "s|--ignore-gpu-blacklist|--ignore-gpu-blocklist|" "${flags_file}"
	fi
	mapfile -t < "${flags_file}"
fi

for line in "${MAPFILE[@]}"; do
	if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
		flags+=("${line}")
	fi
done

unset flags_file krisp_bin krisp_b2


exec /usr/lib/@ELECTRON@/electron \
	/usr/lib/@PKGNAME@/app.asar \
	--ozone-platform-hint=auto \
	"${flags[@]}" "$@"
