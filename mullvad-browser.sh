#!/bin/sh

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
USER_FLAGS_FILE="$XDG_CONFIG_HOME/mullvad-browser-flags.conf"

if [ -f "$USER_FLAGS_FILE" ]; then
  USER_FLAGS="$(cat "$USER_FLAGS_FILE" | sed 's/#.*//')"
fi

exec /opt/mullvad-browser-bin/Browser/mullvadbrowser "$@" $USER_FLAGS
