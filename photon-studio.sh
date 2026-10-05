#!/usr/bin/env bash

set -euo pipefail

appdir=/opt/photon-studio
user_flags=()

config_home="${XDG_CONFIG_HOME:-}"
if [[ -z "${config_home}" && -n "${HOME:-}" ]]; then
  config_home="${HOME}/.config"
fi

# Optional Chromium/Electron flags, one per line, e.g. --enable-wayland-ime.
if [[ -n "${config_home}" && -f "${config_home}/photon-studio-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${config_home}/photon-studio-flags.conf"
fi

exec "${appdir}/AppRun" "${user_flags[@]}" "$@"
