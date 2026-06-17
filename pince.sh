#!/bin/sh
: '
Copyright (C) 2016-2017 Korcan Karaokçu <korcankaraokcu@gmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
'

PYTHON="/usr/bin/python3"
PINCE_PY="/usr/lib/pince/PINCE.py"

if [ -n "$1" ]; then
    PCT_DIR=$(cd -P -- "$(dirname -- "$1")" && pwd -P) || exit 1
    PCT_FILE="$PCT_DIR/$(basename -- "$1")"
fi

if [ "$(id -u)" = "0" ]; then
    "$PYTHON" "$PINCE_PY" "$PCT_FILE"
else
    # Preserve env vars to keep settings like theme preferences.
    # Pkexec does not support passing all of env via a flag like `-E` so we need to
    # rebuild the env and then pass it through.
    set --
    while IFS= read -r line
    do
        set -- "$@" "$line"
    done <<EOF
$(printenv)
EOF

    pkexec env "$@" "$PYTHON" "$PINCE_PY" "$PCT_FILE"
fi