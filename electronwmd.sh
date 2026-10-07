#!/bin/bash
set -e
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@runname@"
export CHROME_DESKTOP="@appname@.desktop"
_SANDBOX_ARG=()
if [[ "${EUID}" -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
	_SANDBOX_ARG=("--no-sandbox")
fi
exec electron@electronversion@ "${_SANDBOX_ARG[@]}" --app "${_RUNNAME}" "$@"