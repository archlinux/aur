#!/bin/sh
program=`basename "$0"`
/usr/bin/wine "/usr/lib/qaac/${program}64.exe" "$@"
