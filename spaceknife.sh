#!/bin/bash
set -e
export _APPDIR="/usr/lib/@appname@"
export PATH="${_APPDIR}${PATH:+:$PATH}"
export SPACEKNIFE_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/@pkgname@"
exec "/usr/lib/@appname@/@appname@" "$@"