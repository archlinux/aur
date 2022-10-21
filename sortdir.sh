#!/bin/sh
ME="${0##*/}"

case "$1" in
  -h | --help )
    printf 'usage: %s command [argument ...]\n' "$ME"
    exit 0
  ;;
  * )
    : pass
  ;;
esac

LIBSORTDIR="${LIBSORTDIR:-/usr/lib/libsortdir.so}"

if [ -z "$LD_PRELOAD" ]; then
  LD_PRELOAD="$LIBSORTDIR"
else
  # This is The Right Way (tm)
  # Appending the new library to the old LD_PRELOAD would suck.
  LD_PRELOAD="$LIBSORTDIR $LD_PRELOAD"
fi
export LD_PRELOAD

if [ "$#" -eq 0 ]; then
  prog="${SHELL:-/bin/sh}"
else
  prog="$1"
  shift
fi
exec "$prog" "$@"

# eof
