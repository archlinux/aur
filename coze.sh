#!/usr/bin/env bash

set -euo pipefail

appdir="/usr/lib/coze"
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

if [[ -n "${config_home}" && -f "${config_home}/coze-flags.conf" ]]; then
  while IFS= read -r flag_line || [[ -n "${flag_line}" ]]; do
    flag_line="${flag_line%%#*}"
    read -r -a flag_parts <<<"${flag_line}"
    user_flags+=("${flag_parts[@]}")
  done <"${config_home}/coze-flags.conf"
fi

export NODE_ENV="${NODE_ENV:-production}"
# 上游入口按这两个环境变量找资源目录、走打包布局，缺了会解析出 app/app/renderer 的错误路径
export COZE_DESKTOP_RESOURCES_PATH="${COZE_DESKTOP_RESOURCES_PATH:-${resources_dir}}"
export COZE_DESKTOP_DEV_SHELL="${COZE_DESKTOP_DEV_SHELL:-true}"

exec "${electron}" \
  --ozone-platform-hint=auto \
  --class=Coze \
  "${user_flags[@]}" \
  "${resources_dir}/app" \
  "$@"
