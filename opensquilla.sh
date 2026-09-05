#!/usr/bin/env bash

set -euo pipefail

appdir="/usr/lib/opensquilla"
electron="/usr/lib/electron42/electron"
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

if [[ -n "${config_home}" && -f "${config_home}/opensquilla-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${config_home}/opensquilla-flags.conf"
fi

export NODE_ENV="${NODE_ENV:-production}"
export ELECTRON_IS_DEV="${ELECTRON_IS_DEV:-0}"
export ELECTRON_OVERRIDE_DIST_PATH="${resources_dir}"

exec "${electron}" \
  --ozone-platform-hint=auto \
  --class=OpenSquilla \
  "${user_flags[@]}" \
  "${resources_dir}/app.asar" \
  "$@"
