#!/usr/bin/env bash
set -euo pipefail

appdir="/usr/lib/minimax-hub"
electron="/usr/lib/electron39/electron"
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

if [[ -n "${config_home}" && -f "${config_home}/minimax-hub-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${config_home}/minimax-hub-flags.conf"
fi

export NODE_ENV="${NODE_ENV:-production}"
export ELECTRON_IS_DEV="${ELECTRON_IS_DEV:-0}"
export HILO_DESKTOP_RESOURCES_PATH="${HILO_DESKTOP_RESOURCES_PATH:-${resources_dir}}"
export HILO_DISABLE_BUILTIN_UPDATER="${HILO_DISABLE_BUILTIN_UPDATER:-1}"
export HILO_GATEWAY_NODE_PATH="${HILO_GATEWAY_NODE_PATH:-/usr/bin/node}"
export FFMPEG_PATH="${FFMPEG_PATH:-/usr/bin/ffmpeg}"
export FFPROBE_PATH="${FFPROBE_PATH:-/usr/bin/ffprobe}"

if [[ -z "${HILO_OPENCODE_BINARY_PATH:-}" ]]; then
  for opencode_candidate in \
    /usr/bin/opencode \
    /usr/local/bin/opencode \
    "${HOME:-}"/.npm-global/bin/opencode \
    "${HOME:-}"/.local/bin/opencode \
    "${HOME:-}"/.nvm/versions/node/*/bin/opencode; do
    if [[ -x "${opencode_candidate}" ]]; then
      export HILO_OPENCODE_BINARY_PATH="${opencode_candidate}"
      break
    fi
  done
fi

exec "${electron}" \
  --ozone-platform-hint=auto \
  --class=MiniMaxHub \
  "${user_flags[@]}" \
  "${resources_dir}/app.asar" \
  "$@"
