#!/bin/sh -eu

_kernel_install() {
	kver="$(basename "$(dirname "$path")")"
	vmlinuz="$(realpath "$path")"
	echo + kernel-install "$@" "$kver" "$vmlinuz"
	kernel-install "$@" "$kver" "$vmlinuz"
}

_kernel_install_all() {
	for path in usr/lib/modules/*/vmlinuz; do
		_kernel_install "$@"
	done
}

while read -r path; do
	case "$path" in
	usr/lib/modules/*/vmlinuz)
		_kernel_install "$@"
		;;
	*)
		_kernel_install_all "$@"
		exit
		;;
	esac
done
