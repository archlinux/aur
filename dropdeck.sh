#!/usr/bin/env bash
set -euo pipefail

cfg_home="${XDG_CONFIG_HOME:-${HOME}/.config}"
cfg_dir="${cfg_home}/dropdeck"
settings_file="${cfg_dir}/settings.json"

mkdir -p "${cfg_dir}"

if [[ ! -f "${settings_file}" && -f "/usr/share/dropdeck/settings.example.json" ]]; then
  cp "/usr/share/dropdeck/settings.example.json" "${settings_file}"
fi

exec /usr/bin/qs -p /usr/share/dropdeck
