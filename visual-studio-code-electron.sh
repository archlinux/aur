#!/bin/bash
_APPDIR="/usr/lib/@appname@"
_RUNNAME="${_APPDIR}/@appname@.js"
export CHROME_DESKTOP="@appname@.desktop"
_SANDBOX_ARG=()
[[ "${EUID}" -eq 0 && "${ELECTRON_RUN_AS_NODE}" != "1" ]] && _SANDBOX_ARG=("--no-sandbox")
[[ ! -d "${_APPDIR}" ]] && { echo "Error: Application directory not found: ${_APPDIR}" >&2; exit 1; }
[[ ! -f "${_RUNNAME}" ]] && { echo "Error: Application entry point not found: ${_RUNNAME}" >&2; exit 1; }
cd "${_APPDIR}" || exit 1
exec electron@electronversion@ "${_SANDBOX_ARG[@]}" --app "${_RUNNAME}" "$@"