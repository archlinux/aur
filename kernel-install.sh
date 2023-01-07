#!/bin/bash

set -euo pipefail
# Inherit set -e down to command substitutions
shopt -s inherit_errexit

extract_kernel_version() {
	local heads
	heads="${1%/vmlinuz}"
	echo "${heads##*/}"
}

kernel_images=()

while read -r path; do
	case "$path" in
	usr/lib/modules/*/vmlinuz)
		kernel_images+=("/$path")
		;;
	*)
		kernel_images+=(/usr/lib/modules/*/vmlinuz)
		break
		;;
	esac
done

add=0
for o; do
	case "$o" in
	add)
		add=1
		;;
	esac
done

for kernel_image in "${kernel_images[@]}"; do
	echo +kernel-install "$@" "$(extract_kernel_version "$kernel_image")" "$kernel_image"
	kernel-install "$@" "$(extract_kernel_version "$kernel_image")" "$kernel_image" || true
done
