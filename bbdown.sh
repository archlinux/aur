#!/bin/sh
cfg="${XDG_CONFIG_HOME:-$HOME/.config}/BBDown/BBDown.config"
videos=$(xdg-user-dir VIDEOS 2>/dev/null)

case "$videos" in
  ""|"$HOME") videos="$HOME/Videos" ;;
esac

case " $* " in
  *" --config-file "*|*" --config-file="*) ;;
  *) set -- "$@" --config-file "$cfg" ;;
esac

case " $* " in
  *" --work-dir "*|*" --work-dir="*) ;;
  *) set -- "$@" --work-dir "${videos:-$HOME/Videos}/BBDown" ;;
esac

exec /usr/lib/BBDown/BBDown "$@"

