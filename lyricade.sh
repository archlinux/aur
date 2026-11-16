#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
export APPDIR="${_APPDIR}"
export SHARUN_DIR="${_APPDIR}"
export ARGV0="@appname@"
exec "${_APPDIR}/AppRun.sh" "$@"
