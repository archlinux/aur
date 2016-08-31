#!/bin/sh

. /etc/conf.d/suspend-hacks

case "$1" in
	pre)
		echo "Stopping before $2: $DAEMONS" >&2
		for daemon in $DAEMONS; do
			systemctl stop "$daemon"
		done
		;;
	post)
		echo "Starting after $2: $DAEMONS" >&2
		for daemon in $DAEMONS; do
			systemctl start "$daemon"
		done
		;;
	*)
		echo 'meant to be called by systemd suspend!' >&2
		exit 1
		;;
esac
