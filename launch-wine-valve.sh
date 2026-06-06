#!/bin/sh

winedir="$(dirname "$0")"
export LD_LIBRARY_PATH=":$winedir/lib:/usr/lib"
"$winedir/bin/wine" $*
