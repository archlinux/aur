#!/bin/sh
set -e
bindir=`dirname "$0"`
sharedir="$bindir"/../share
exec java -jar "$sharedir"/ConvertWithMoss/convertwithmoss.jar "$@"
