#!/bin/sh

DEMO='/usr/share/th06-demo'

if ! test -d "$DEMO"; then
	echo 'You need to install the th06-demo-data from AUR to use this wrapper.'
	exit 1
fi

exec pytouhou -p "$DEMO" "$@"
