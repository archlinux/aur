#!/usr/bin/env bash
set -euo pipefail

appdir="/usr/lib/minimax-code-desktop"
electron="/usr/lib/electron42/electron"
user_flags=()

[[ -x "${electron}" ]] || {
  echo "Missing Electron runtime: ${electron}" >&2
  exit 1
}

config_home="${XDG_CONFIG_HOME:-}"
if [[ -z "${config_home}" && -n "${HOME:-}" ]]; then
  config_home="${HOME}/.config"
fi

flags_conf=''
if [[ -n "${config_home}" && -f "${config_home}/minimax-code-desktop-flags.conf" ]]; then
  flags_conf="${config_home}/minimax-code-desktop-flags.conf"
fi

if [[ -n "${flags_conf}" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${flags_conf}"
fi

export NODE_ENV="${NODE_ENV:-production}"
export MINIMAX_CODE_RESOURCES_PATH="${appdir}"
export MINIMAX_CODE_DISABLE_UPDATER="${MINIMAX_CODE_DISABLE_UPDATER:-1}"

exec "${electron}" \
  --ozone-platform-hint=auto \
  --class=MiniMaxCode \
  "${user_flags[@]}" \
  "${appdir}/app.asar" \
  "$@"
