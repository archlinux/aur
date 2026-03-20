#!/usr/bin/env bash
set -euo pipefail

app_dir='/usr/share/xtream-m3u-plus-iptv-player'
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}/xtream-m3u-plus-iptv-player"

mkdir -p "${data_dir}"
cd "${data_dir}"

exec /usr/bin/python "${app_dir}/IPTV M3U_Plus PLAYER by MY-1.py" "$@"
