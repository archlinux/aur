#!/bin/sh
# The static binary reads only the old terminfo format, whose files start
# with the bytes 1a 01. ncurses 6.1 and later write entries such as
# xterm-256color in the new format (1e 02), so those are swapped for the
# entry without the last suffix or for xterm.

magic() {
  od -An -tx1 -N2 "/usr/share/terminfo/$(printf %.1s "$1")/$1" 2>/dev/null
}

if [ "$(magic "$TERM")" = ' 1e 02' ]; then
  if [ "$(magic "${TERM%-*}")" = ' 1a 01' ]; then
    TERM=${TERM%-*}
  else
    TERM=xterm
  fi
  export TERM
fi

exec /usr/lib/sngrep/sngrep "$@"
