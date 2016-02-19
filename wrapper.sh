#!/bin/sh
export LD_PRELOAD="/usr/lib/libcurl.so.3"
exec /usr/bin/runescape-launcher.real "$@"
