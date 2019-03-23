#!/bin/sh

. /etc/paccache-hook.conf

if [ "$installed" = true ]; then
	echo "Removing old installed packages..."
	paccache "-rk${installed_keep:-2}" $extra_args $installed_extra_args
fi

if [ "$uninstalled" = true ]; then
	echo "Removing old uninstalled packages..."
	paccache "-ruk${uninstalled_keep:-0}" $extra_args $uninstalled_extra_args
fi
