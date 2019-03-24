#!/bin/sh

. /etc/paccache-hook.conf

cache_args=""
for cdir in $cache_dirs; do
	cache_args="$cache_args -c $cdir"
done

if [ "$installed" = true ]; then
	echo "Removing old installed packages..."
	if [ -n "$installed_move_to" ]; then
		paccache $cache_args -m "$installed_move_to" "-k${installed_keep:-2}" $extra_args $installed_extra_args
	else
		paccache $cache_args "-rk${installed_keep:-2}" $extra_args $installed_extra_args
	fi
fi

if [ "$uninstalled" = true ]; then
	echo "Removing old uninstalled packages..."
	if [ -n "$uninstalled_move_to" ]; then
		paccache $cache_args -m "$uninstalled_move_to" "-uk${uninstalled_keep:-0}" $extra_args $uninstalled_extra_args
	else
		paccache $cache_args "-ruk${uninstalled_keep:-0}" $extra_args $uninstalled_extra_args
	fi
fi
