#!/bin/sh
set -e
_APPNAME=@appname@
export CLOUD189_CONFIG_DIR="${CLOUD189_CONFIG_DIR:=$HOME/.config/@appname@}"
export CLOUD189_VERBOSE="${CLOUD189_VERBOSE:=0}"
exec "${_APPNAME}" "$@" || exit $?