#!/usr/bin/env bash

# check microprocessor architecture level
if /usr/lib/ld-linux-x86-64.so.2 --help | grep -qsE '^\s+x86-64-v3.*supported.*$' ; then
  _message=''
  _message+=$'Your processor supports x86-64-v3.\n'
  _message+=$'You may want to use mercury-browser instead.'
elif /usr/lib/ld-linux-x86-64.so.2 --help | grep -qsE '^\s+x86-64-v2.*supported.*$' ; then
  _message=''
  _message+=$'The fastest Firefox fork on Earth.'
else
  _message=''
  _message+=$'Your processor does not support x86-64-v2 or x86-64-v3.\n'
  _message+=$'mercury-browser may not work on your computer.'
fi

# Allow users to override command-line options
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
_FLAGFILE="$XDG_CONFIG_HOME/mercury-flags.conf"
if [[ -f "$_FLAGFILE" ]]; then
  _USER_FLAGS=$(cat "$_FLAGFILE")
fi

# display processor support message
if tty -s ; then
  echo "$_message"
else
  [ ! -e "$HOME/.mercury" ] && notify-send -a "mercury-browser" -t 7500 "$_message"
fi

# Launch
exec /opt/mercury-browser-sse3/mercury $_USER_FLAGS "$@"
