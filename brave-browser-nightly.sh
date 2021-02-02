#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
BRAVE_USE_FLASH_IF_AVAILABLE="${BRAVE_USE_FLASH_IF_AVAILABLE:-true}"

# Allow users to override command-line options
USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-flags.conf"
if [[ -f $USER_FLAGS_FILE ]]; then
   USER_FLAGS="$(cat $USER_FLAGS_FILE | sed 's/#.*//')"
fi

TZ=UTC /usr/lib/brave-browser-nightly/brave-browser-nightly "$@" $USER_FLAGS
