#!/bin/bash
set -o pipefail
_APPNAME=@appname@
export CLOUD189_CONFIG_DIR="${CLOUD189_CONFIG_DIR:=$HOME/.config/@appname@}"
export CLOUD189_VERBOSE="${CLOUD189_VERBOSE:=0}"
exec "${_APPNAME}" "$@" || exit $?