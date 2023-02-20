#!/bin/sh

ME="${0##*/}"

# Copyright © 2022 Klaus Alexander Seistrup <klaus@seistrup.dk>
# Licensed under the GNU Affero General Public License v3+.
#
# Updated: 2023-02-20

die() {
  printf '%s: %s\n' "$ME" "$*" >&2
  exit 1
}

export HELIX_HX='/usr/lib/helix/hx'
export HELIX_RUNTIME='/var/lib/helix/runtime'

test -x "$HELIX_HX"      || die 'cannot find helix:' "$HELIX_HX"
test -d "$HELIX_RUNTIME" || die 'no such directory:' "$HELIX_RUNTIME"

exec "$HELIX_HX" "$@"
exit 127

# eof
