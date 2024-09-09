#!/bin/bash
set -e

. /etc/paccache-hook.conf

common_args=()
for dir in "${cache_dirs[@]}"; do
	common_args+=("--cachedir" "$dir")
done
common_args+=("${extra_args[@]}")

if [ "$installed" = "true" ]; then
	installed_args=("--keep" "${installed_keep:-2}")
	if [ -n "$installed_move_to" ]; then
		installed_args+=("--move" "$installed_move_to")
	else
		installed_args+=("--remove")
	fi

	echo "Removing old installed packages..."
	paccache "${installed_args[@]}" "${installed_extra_args[@]}" "${common_args[@]}"
fi

if [ "$uninstalled" = "true" ]; then
	uninstalled_args=("--uninstalled" "--keep" "${uninstalled_keep:-0}")
	if [ -n "$uninstalled_move_to" ]; then
		uninstalled_args+=("--move" "$uninstalled_move_to")
	else
		uninstalled_args+=("--remove")
	fi

	echo "Removing old uninstalled packages..."
	paccache "${uninstalled_args[@]}" "${uninstalled_extra_args[@]}" "${common_args[@]}"
fi
