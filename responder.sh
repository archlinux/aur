#!/bin/bash

# If not run with "-h", "--help", or "--version", request root privileges
if [[ $EUID != 0 && ! ("$*" =~ (-h|--version)) ]]; then
	sudo "$0" "$@"
	exit $?
fi

cd "/usr/share/responder" || { echo 'Cannot change to responder directory' ; exit 1; }
exec python Responder.py "$@"
