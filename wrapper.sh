#!/bin/sh
# disable wine error messages by default
export WINEDEBUG="${WINEDEBUG:=-all}"
program=`basename "$0"`
exec /usr/bin/wine "/usr/lib/qaac/${program}64.exe" "$@"
