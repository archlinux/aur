#!/bin/bash
set -e
_APPDIR="/usr/lib/visual-studio-code-electron"
_RUNNAME="${_APPDIR}/visual-studio-code-electron.js"
export CHROME_DESKTOP="visual-studio-code-electron.desktop"
_SANDBOX_ARG=()
if [[ "${EUID}" -eq 0 ]] && [[ "${ELECTRON_RUN_AS_NODE}" != "1" ]]; then
    _SANDBOX_ARG=("--no-sandbox")
fi
cd "${_APPDIR}"
exec electron43 "${_SANDBOX_ARG[@]}" --app "${_RUNNAME}" "$@"