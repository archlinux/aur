#!/usr/bin/env bash

# check microprocessor architecture level
if /usr/lib/ld-linux-x86-64.so.2 --help | grep -qsE '^\s+x86-64-v3.*supported.*$' ; then
  _message+=$'Enjoy the fastest Firefox fork on Earth.'
else
  _message=''
  _message+=$'Your processor does not support x86-64-v3.\n'
  _message+=$'mercury-browser may not work on your computer.'
fi

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}

# Allow users to override command-line options
if [[ -f $XDG_CONFIG_HOME/mercury-flags.conf ]]; then
  MERCURY_USER_FLAGS="$(cat $XDG_CONFIG_HOME/mercury-flags.conf)"
fi

# display processor support message
if tty -s ; then
  echo "$_message"
else
  [ ! -e "$HOME/.mercury" ] && notify-send -a "mercury-browser" -t 7500 "$_message"
fi

# Launch
exec /opt/mercury-browser/mercury $MERCURY_USER_FLAGS "$@"
