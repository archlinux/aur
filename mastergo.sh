#!/usr/bin/env bash

set -euo pipefail

appdir="/usr/lib/mastergo"
electron="/usr/lib/electron31/electron"
resources_dir="${appdir}/resources"
user_flags=()

[[ -x "${electron}" ]] || {
  echo "Missing Electron runtime: ${electron}" >&2
  exit 1
}

config_home="${XDG_CONFIG_HOME:-}"
if [[ -z "${config_home}" && -n "${HOME:-}" ]]; then
  config_home="${HOME}/.config"
fi

if [[ -n "${config_home}" && -f "${config_home}/mastergo-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${config_home}/mastergo-flags.conf"
fi

export NODE_ENV="${NODE_ENV:-production}"
export ELECTRON_IS_DEV="${ELECTRON_IS_DEV:-0}"
export MASTERGO_DESKTOP_RESOURCES_PATH="${MASTERGO_DESKTOP_RESOURCES_PATH:-${resources_dir}}"

exec "${electron}" \
  --ozone-platform-hint=auto \
  --class=MasterGo \
  "${user_flags[@]}" \
  "${resources_dir}/app" \
  "$@"
