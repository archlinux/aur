#!/bin/bash

set -euo pipefail
shopt -s inherit_errexit nullglob

extract_kernel_version() {
	local heads
	heads="${1%/vmlinuz}"
	echo "${heads##*/}"
}

all_kernel_images=0
kernel_images=()

while read -r path; do
	case "$path" in
	usr/lib/modules/*/vmlinuz)
		kernel_images+=("/$path")
		;;
	*)
		all_kernel_images=1
		;;
	esac
done

((all_kernel_images)) && for file in /usr/lib/modules/*/vmlinuz; do
	pacman -Qqo "$file" 1>/dev/null 2>/dev/null &&
		kernel_images+=("$file")
done

for kernel_image in "${kernel_images[@]}"; do
	echo +kernel-install "$@" "$(extract_kernel_version "$kernel_image")" "$kernel_image"
	kernel-install "$@" "$(extract_kernel_version "$kernel_image")" "$kernel_image" || true
done
