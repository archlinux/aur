#!/bin/bash
set -euo pipefail

# Launcher for devin-desktop-next using the system Electron runtime.
# Based on Arch Linux's code.sh launcher pattern: cli.js runs in Node mode
# to handle CLI args, then respawns Electron with main.js as the app entry
# point and the user's flags/files appended.

_name=@@ELECTRON@@
_app=/opt/devin-desktop-next/resources/app
_cli="${_app}/out/cli.js"
_main="${_app}/out/main.js"

# User-configurable flags (mirrors Arch's code/code.sh convention).
_flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/devin-desktop-next-flags.conf"

# Read a flags file, skipping blank lines and comments.
_read_flags() {
    local file="$1"
    local -n _out="$2"
    local line
    while IFS= read -r line || [[ -n "$line" ]]; do
        [[ "$line" =~ ^[[:space:]]*# ]] && continue
        [[ -z "${line// /}" ]] && continue
        _out+=("$line")
    done < "$file"
}

_codeflags=()
if [[ -f "${_flags_file}" ]]; then
    _read_flags "${_flags_file}" _codeflags
fi

_electronflags=()
_electron_flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${_name}-flags.conf"
if [[ -f "${_electron_flags_file}" ]]; then
    _read_flags "${_electron_flags_file}" _electronflags
elif [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/electron-flags.conf" ]]; then
    _read_flags "${XDG_CONFIG_HOME:-$HOME/.config}/electron-flags.conf" _electronflags
fi

ELECTRON_RUN_AS_NODE=1 exec "/usr/lib/${_name}/electron" "${_cli}" "${_electronflags[@]}" "${_main}" "${_codeflags[@]}" "$@"
