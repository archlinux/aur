#!/bin/sh
ME="${0##*/}"

usage() {
  cat << __EOT__
Usage: $ME command [argument …]

When using the sortdir library, applications will receive directory
entries in alphabetical order.

Ordering depends on the current locale used by your application.
You can override this by setting the SORTDIR_LOCALE environment
variable. Examples:

  export SORTDIR_LOCALE=hu_HU
or
  export SORTDIR_LOCALE=C

Version comparing (see strverscmp(3)) is performed if SORTDIR_VERSCMP
is set to any value. In this case SORTDIR_LOCALE is ignored.

Reverse ordering is provided if SORTDIR_REVERSE is set to any value.
__EOT__
}

case "$1" in
  -h | --help )
    usage
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
set -euf

export LD_PRELOAD

if [ "$#" -eq 0 ]; then
  prog="${SHELL:-/bin/sh}"
else
  prog="$1"
  shift
fi
exec "$prog" "$@"

# eof
