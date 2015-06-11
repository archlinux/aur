#!/bin/sh

if [ "$1" = "--version" ]; then
	shift
        pkg-config gnutls --modversion "$@"
else
	pkg-config gnutls "$@"
fi
