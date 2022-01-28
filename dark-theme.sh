#!/usr/bin/env sh

# enable "strict mode"
set -eu

CURRENT=$(gsettings get org.gnome.desktop.interface gtk-theme)

case $1 in
    dark)
      for f in "$HOME/.local/share/dark-mode.d/"*; do
        "$f" &
      done
    ;;
    light)
      for f in "$HOME/.local/share/light-mode.d/"*; do
        "$f" &
      done
    ;;
    toggle)
      if echo "$CURRENT" | grep -q "dark"; then
        exec $0 light
      else
        exec $0 dark
      fi
    ;;
    reapply)
      if echo "$CURRENT" | grep -q "dark"; then
        exec $0 dark
      else
        exec $0 light
      fi
    ;;
    *)
      echo "Command $1 not valid."
      exit 1
esac

wait
