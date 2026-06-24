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

_codeflags=()
if [[ -f "${_flags_file}" ]]; then
    mapfile -t _codeflags < "${_flags_file}"
fi

_electronflags=()
_electron_flags_file="${XDG_CONFIG_HOME:-$HOME/.config}/${_name}-flags.conf"
if [[ -f "${_electron_flags_file}" ]]; then
    mapfile -t _electronflags < "${_electron_flags_file}"
elif [[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/electron-flags.conf" ]]; then
    mapfile -t _electronflags < "${XDG_CONFIG_HOME:-$HOME/.config}/electron-flags.conf"
fi

ELECTRON_RUN_AS_NODE=1 exec "/usr/lib/${_name}/electron" "${_cli}" "${_electronflags[@]}" "${_main}" "${_codeflags[@]}" "$@"
