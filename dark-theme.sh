#!/usr/bin/env sh

# enable "strict mode"
set -eu

CURRENT=$(gsettings get org.gnome.desktop.interface gtk-theme)

if [ "$1" = "dark" ]; then
  for f in "$HOME/.local/share/dark-mode.d/"*; do
    ( "$f" )
  done
elif [ "$1" = "light" ]; then
  for f in "$HOME/.local/share/light-mode.d/"*; do
    ( "$f" )
  done
elif [ "$1" = "toggle" ]; then
  if echo "$CURRENT" | grep -q "dark"; then
    exec $0 light
  else
    exec $0 dark
  fi
elif [ "$1" = "reapply" ]; then
  if echo "$CURRENT" | grep -q "dark"; then
    exec $0 dark
  else
    exec $0 light
  fi
else
  echo "Command $1 not valid."
  exit 1
fi
