#!/bin/bash

set -euo pipefail

flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/antigravity-flags.conf"

if [[ -f "${flags_file}" ]]; then
    mapfile -t < "${flags_file}" CODEMAPFILE
fi

antigravityflags=()
for line in "${CODEMAPFILE[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        antigravityflags+=("${line}")
    fi
done

# don't edit the electron binary name or lib path here! simply change the variable in the PKGBUILD and we will sed it into the correct one :)
name=@ELECTRON@
lib_path=@LIB_PATH@
flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/@ELECTRON@-flags.conf"
fallback_file="${XDG_CONFIG_HOME:-$HOME/.config}/electron-flags.conf"

lines=()
if [[ -f "${flags_file}" ]]; then
    mapfile -t lines < "${flags_file}"
elif [[ -f "${fallback_file}" ]]; then
    mapfile -t lines < "${fallback_file}"
fi

electronflags=()
for line in "${lines[@]}"; do
    if [[ ! "${line}" =~ ^[[:space:]]*#.* ]] && [[ -n "${line}" ]]; then
        electronflags+=("${line}")
    fi
done

ELECTRON_RUN_AS_NODE=1 exec /usr/lib/@ELECTRON@/electron @LIB_PATH@/out/cli.js "${electronflags[@]}" --app=@LIB_PATH@/ "${antigravityflags[@]}" "$@"
