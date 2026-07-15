#!/bin/sh
set -eu

plugin_src="/opt/rebased/plugins/localization-zh/lib/localization-zh.jar"
plugin_dst="${XDG_DATA_HOME:-${HOME}/.local/share}/detachhead/IdeaIC1.1/localization-zh.jar"

if [ -r "${plugin_src}" ]; then
  mkdir -p "$(dirname "${plugin_dst}")"
  if [ ! -f "${plugin_dst}" ] || ! cmp -s "${plugin_src}" "${plugin_dst}"; then
    cp "${plugin_src}" "${plugin_dst}"
  fi
fi

exec /opt/rebased/bin/rebased "$@"
