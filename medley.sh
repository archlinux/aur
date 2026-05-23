#!/bin/sh
state_home="${XDG_STATE_HOME:-${HOME}/.local/state}"
exec /usr/lib/interlisp/medley/scripts/medley/medley.sh \
  --logindir "${state_home}/medley" "$@"
