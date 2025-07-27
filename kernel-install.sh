#!/bin/bash

set -euo pipefail
shopt -s inherit_errexit nullglob

cd /

all_kernels=0
declare -A versions

add_file() {
	local kver="$1"
	kver="${kver##usr/lib/modules/}"
	kver="${kver%%/*}"
	versions["$kver"]=""
}

while read -r path; do
	case "$path" in
	usr/lib/modules/*/vmlinuz | usr/lib/modules/*/extramodules/*)
		add_file "$path"
		;;
	*)
		all_kernels=1
		;;
	esac
done

((all_kernels)) && for file in usr/lib/modules/*/vmlinuz; do
	pacman -Qqo "$file" 1>/dev/null 2>/dev/null &&
		add_file "$file"
done

for kver in "${!versions[@]}"; do
	kimage="/usr/lib/modules/$kver/vmlinuz"
	kernel-install "$@" "$kver" "$kimage" || true
done
