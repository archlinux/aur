#!/bin/sh
while read -r vmlinuz; do
	: &&
		kver="$(basename "$(dirname "$vmlinuz")")" &&
		vmlinuz="$(realpath "${vmlinuz}")" &&
		echo + kernel-install "$@" "$kver" "$vmlinuz" &&
		kernel-install -v "$@" "$kver" "$vmlinuz" | while read -r line; do
			case "$line" in
			'+'*) ;;
			*) echo "$line" ;;
			esac
		done
done
