#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
exec @options@ electron@electronversion@ "${_RUNNAME}" "$@" || exit $?
