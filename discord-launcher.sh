#!/usr/bin/env bash

set -euo pipefail

declare -a flags


flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/@PKGNAME@-flags.conf"
krisp_bin="${XDG_CONFIG_HOME:-$HOME/.config}/@PKGNAME@/@PKGVER@/modules/@PKGNAME@_krisp/@PKGNAME@_krisp.node"
krisp_b2=@KRISPB2@

if hash rizin &> /dev/null; then
	# Patch Krisp binary to ignore signature check
	if [[ -f "${krisp_bin}" && $(b2sum "${krisp_bin}" | head -c 128) == $krisp_b2 ]]; then
		addr=$(rz-find -x '4889dfe8........4889dfe8' "${krisp_bin}" | head -n1)
		rizin -q -w -c "s $addr + 0x12 ; wao nop" "${krisp_bin}" &> /dev/null
	fi
fi

if [[ -f "${flags_file}" ]]; then
	if grep -q '\--ignore-gpu-blacklist' "${flags_file}"; then
		sed -i "s|--ignore-gpu-blacklist|--ignore-gpu-blocklist|" "${flags_file}"
	fi
	mapfile -t < "${flags_file}"
else
	cat > "${flags_file}" <<EOF
#--ignore-gpu-blocklist
#--enable-gpu-rasterization
#--enable-zero-copy
EOF
fi

for line in "${MAPFILE[@]}"; do
	if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
		flags+=("${line}")
	fi
done

unset flags_file krisp_bin krisp_b2


exec /usr/bin/electron@ELECTRON@ \
	/usr/lib/@PKGNAME@/app.asar \
	--ozone-platform-hint=auto \
	"${flags[@]}" "$@"
