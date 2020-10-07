#!/bin/sh

# If not run with "-h", "--help", or "--version", request root privileges
if [[ $EUID != 0 && !("$@" =~ (-h|--version)) ]]; then
	sudo "$0" "$@"
	exit $?
fi

cd /usr/share/responder
exec python Responder.py "$@"
