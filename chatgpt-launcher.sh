#!/bin/bash
# SPDX-FileCopyrightText: 2026 Arch Linux Contributors
# SPDX-License-Identifier: 0BSD
set -euo pipefail

user_flags=()
ozone_flags=()

config_home="${XDG_CONFIG_HOME:-}"
if [[ -z "${config_home}" && -n "${HOME:-}" ]]; then
  config_home="${HOME}/.config"
fi

if [[ -n "${config_home}" && -f "${config_home}/codex-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${config_home}/codex-flags.conf"
fi

# Prefer native Wayland rendering in Wayland sessions. Explicit user flags win.
if [[ "${XDG_SESSION_TYPE:-}" == wayland || -n "${WAYLAND_DISPLAY:-}" ]]; then
  ozone_flags=(--ozone-platform=wayland)
fi

for flag in "${user_flags[@]}" "$@"; do
  case "${flag}" in
    --ozone-platform=*|--ozone-platform-hint=*) ozone_flags=() ;;
  esac
done

exec /usr/lib/chatgpt/ChatGPT "${ozone_flags[@]}" "${user_flags[@]}" "$@"
