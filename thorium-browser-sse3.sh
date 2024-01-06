#!/usr/bin/env bash

# check microprocessor architecture level
if /usr/lib/ld-linux-x86-64.so.2 --help | grep -qsE '^\s+x86-64-v3.*supported.*$' ; then
  _message=''
  _message+=$'Your processor supports x86-64-v3.\n'
  _message+=$'You may want to use thorium-browser instead.'
elif /usr/lib/ld-linux-x86-64.so.2 --help | grep -qsE '^\s+x86-64-v2.*supported.*$' ; then
  _message=''
  _message+=$'The fastest browser on Earth.'
else
  _message=''
  _message+=$'Your processor does not support x86-64-v2 or x86-64-v3.\n'
  _message+=$'thorium-browser may not work on your computer.'
fi

# Allow users to override command-line options
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
_FLAGS_FILE="$XDG_CONFIG_HOME/thorium-flags.conf"

if [[ -f "$_FLAGS_FILE" ]]; then
  _USER_FLAGS="$(cat "$_FLAGS_FILE")"
fi

# display processor support message
if tty -s ; then
  echo "$_message"
else
  [ ! -e "$XDG_CONFIG_HOME/thorium" ] && notify-send -a "thorium-browser" -t 7500 "$_message"
fi

# Launch
exec /opt/thorium-browser-sse3/thorium-browser $_USER_FLAGS "$@"
