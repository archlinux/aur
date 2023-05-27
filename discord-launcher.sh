#!/usr/bin/env bash

set -euo pipefail

flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/@PKGNAME@-flags.conf"

declare -a flags

if [[ -f "${flags_file}" ]]; then
	sed -i "s|--ignore-gpu-blacklist|--ignore-gpu-blocklist|" "${flags_file}"
	mapfile -t < "${flags_file}"
else
	cat > "${flags_file}" <<EOF
#--ignore-gpu-blocklist
#--enable-gpu-rasterization
#--enable-zero-copy
EOF
fi

for line in "${MAPFILE[@]}"; do
	if [[ ! "${line}" =~ ^[[:space:]]*#.* ]]; then
		flags+=("${line}")
	fi
done

exec /usr/bin/electron@ELECTRON@ \
	/usr/lib/@PKGNAME@/app.asar \
	--ozone-platform-hint=auto \
	"${flags[@]}" "$@"
