#!/bin/bash
# /usr/bin/zeed-browser — launcher for Zeed browser.
# Follows the chromium-launcher convention: reads user flags from
# ~/.config/zeed-flags.conf (one arg per line, # comments allowed).

set -e

CONF="${XDG_CONFIG_HOME:-$HOME/.config}/zeed-flags.conf"
ZEED_USER_FLAGS=""

if [[ -f "$CONF" ]]; then
  # Strip comments + collapse lines into a single argv string.
  ZEED_USER_FLAGS="$(sed 's/#.*//' "$CONF" | tr '\n' ' ')"
fi

# Tell subprocess PWA launchers + xdg-settings which binary we are.
export CHROME_WRAPPER="/usr/bin/zeed-browser"
export CHROME_DESKTOP="zeed-browser.desktop"

# shellcheck disable=SC2086
exec /opt/zeed-browser/chrome $ZEED_USER_FLAGS "$@"
