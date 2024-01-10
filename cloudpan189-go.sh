#!/bin/sh
set -e
_APPNAME=@appname@
export CLOUD189_CONFIG_DIR="@configdir@:${CLOUD189_CONFIG_DIR}"
export CLOUD189_VERBOSE="${CLOUD189_VERBOSE:=0}"
mkdir -p "@configdir@"
exec "${_APPNAME}" "$@"