#!/bin/sh -e
while read -r vmlinuz; do
	kver="$(basename "$(dirname "$vmlinuz")")"
	vmlinuz="$(realpath "${vmlinuz}")"
	echo + kernel-install "$@" "$kver" "$vmlinuz"
	kernel-install "$@" "$kver" "$vmlinuz"
done
