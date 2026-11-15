#!/bin/bash
# GapCode's background app-server daemon runs from a per-user copy at
# $GAPCODE_HOME/packages/app-server-daemon/current, which upstream's
# standalone installer creates. With a system package nothing creates it
# (and it can vanish when the daemon shuts down), so `gapcode` fails with
# "daemon executable not found". Point it at the packaged install if missing.
_home=${GAPCODE_HOME:-${HOME:+$HOME/.gapcode}}
if [[ -n $_home ]]; then
  _cur=$_home/packages/app-server-daemon/current
  # Leave a working or real (non-symlink) install alone.
  if [[ ! -x $_cur/bin/codex && ( -L $_cur || ! -e $_cur ) ]]; then
    mkdir -p "${_cur%/*}" 2>/dev/null && ln -sfn /opt/gapcode "$_cur" 2>/dev/null
  fi
fi
exec -a gapcode /opt/gapcode/bin/codex "$@"
