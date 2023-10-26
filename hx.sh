#!/bin/sh

ME="${0##*/}"

# Copyright © 2022 Klaus Alexander Seistrup <klaus@seistrup.dk>
# Licensed under the GNU Affero General Public License v3+.
#
# Updated: 2023-10-26

die() {
  printf '%s: %s\n' "$ME" "$*" >&2
  exit 1
}

export HELIX_DEFAULT_RUNTIME='/usr/lib/helix/runtime'

export HELIX_HX='/usr/lib/helix/hx'
test -x "$HELIX_HX" || die 'cannot find helix:' "$HELIX_HX"

exec "$HELIX_HX" "$@"
exit 127

# eof
