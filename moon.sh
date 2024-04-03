#!/usr/bin/env sh

MOON_HOME="${MOON_HOME:-/usr/share/moonbit}"
export MOON_HOME

/usr/lib/moon "$@"
