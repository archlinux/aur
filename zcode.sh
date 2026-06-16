#!/usr/bin/env bash

set -euo pipefail

appdir="/usr/lib/zcode-desktop-bin"
electron="/usr/lib/electron41/electron"
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

if [[ -n "${config_home}" && -f "${config_home}/zcode-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${config_home}/zcode-flags.conf"
fi

export NODE_ENV="${NODE_ENV:-production}"
export ZCODE_DESKTOP_RESOURCES_PATH="${ZCODE_DESKTOP_RESOURCES_PATH:-${resources_dir}}"
export GLM_BINARY_PATH="${GLM_BINARY_PATH:-${resources_dir}/glm/zcode-agent}"
export ZCODE_RG_BINARY="${ZCODE_RG_BINARY:-/usr/bin/rg}"

if [[ -z "${ZCODE_AGENT_SERVER_COMMAND:-}" ]]; then
  export ZCODE_AGENT_SERVER_COMMAND="${appdir}/zcode-agent.sh"
  export ZCODE_AGENT_SERVER_ARGS_JSON="${ZCODE_AGENT_SERVER_ARGS_JSON:-[\"app-server\",\"--stdio\"]}"
fi

exec "${electron}" \
  --enable-sandbox \
  --ozone-platform-hint=auto \
  --class=ZCode \
  "${user_flags[@]}" \
  "${resources_dir}/app.asar" \
  "$@"
