#!/bin/bash
set -o pipefail

# Core variables
_APPDIR="/usr/lib/gemini-desktop"
_APPNAME="gemini-desktop"
_FLAGS_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/${_APPNAME}-flags.conf"

# Set production environment
export NODE_ENV=production
export ELECTRON_IS_DEV=0

# Read user custom flags
declare -a _USER_FLAGS
if [[ -f "${_FLAGS_FILE}" ]]; then
    while read -r line; do
        # Ignore comments and empty lines
        if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
            _USER_FLAGS+=("${line}")
        fi
    done < "${_FLAGS_FILE}"
fi

# Change directory
cd "${_APPDIR}" || exit 1

# Launch logic (handle Root execution)
if [[ "${EUID}" -ne 0 ]] || [[ "${ELECTRON_RUN_AS_NODE}" ]]; then
    exec electron . "${_USER_FLAGS[@]}" "$@"
else
    # Root user must disable sandbox
    exec electron . --no-sandbox "${_USER_FLAGS[@]}" "$@"
fi
