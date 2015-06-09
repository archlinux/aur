#!/bin/sh
set -e

[ -z "$1" ] && {
	echo "Error: broker name is required"
	exit 1
}

export APOLLO_BASE="/var/lib/apollo/$1"
shift

[ ! -d "$APOLLO_BASE" ] && {
	echo "Error: broker doesn't exist"
	exit 1
}

exec apollo "$@"
