#!/usr/bin/env bash

# check microprocessor architecture level
if ! grep -qE '\bavx2\b' /proc/cpuinfo ; then
  _message=$'Your processor does not support AVX2 instructions.\nmercury-browser may not work on your computer.'
  
  # display processor support message
  if tty -s ; then
    echo "$_message"
  else
    [ ! -e "$HOME/.mercury" ] && notify-send -a "mercury-browser" -t 7500 "$_message"
  fi
fi

# Allow users to override command-line options
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
_FLAGFILE="$XDG_CONFIG_HOME/mercury-flags.conf"
if [[ -f "$_FLAGFILE" ]]; then
  _USER_FLAGS=$(cat "$_FLAGFILE")
fi

# Launch
exec /opt/mercury-browser-avx2/mercury $_USER_FLAGS "$@"
