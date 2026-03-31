#!/bin/bash
set -euo pipefail

app_name="cornelsen-offline-lernen"
system_asar="/usr/share/${app_name}/app.asar"
data_home="${XDG_DATA_HOME:-$HOME/.local/share}"
config_home="${XDG_CONFIG_HOME:-$HOME/.config}"
user_app_dir="${data_home}/${app_name}"
user_asar="${user_app_dir}/app.asar"

mkdir -p "${user_app_dir}" "${config_home}/${app_name}"

# Keep a writable app copy for applications that try to write near app resources.
if [ ! -f "${user_asar}" ] || [ "${system_asar}" -nt "${user_asar}" ]; then
	cp -f "${system_asar}" "${user_asar}"
fi

# Upstream emits a noisy Node warning on exit; keep terminal output clean by default.
if [ "${CORNELSEN_SHOW_NODE_WARNINGS:-0}" != "1" ]; then
	export NODE_OPTIONS="${NODE_OPTIONS:+${NODE_OPTIONS} }--no-warnings"
fi

exec electron --user-data-dir="${config_home}/${app_name}" "${user_asar}" "$@"
