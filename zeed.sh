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

# Auto-load the bundled Zeed AI extension so the sidebar + Cmd+Shift+E
# shortcut work out of the box. Users can opt out by setting
# ZEED_SKIP_BUNDLED_EXTENSION=1 in the environment.
ZEED_BUNDLED_EXT="/opt/zeed-browser/bundled_extensions/zeed_ai"
ZEED_EXT_FLAGS=""
if [[ -d "$ZEED_BUNDLED_EXT" && -z "${ZEED_SKIP_BUNDLED_EXTENSION:-}" ]]; then
  ZEED_EXT_FLAGS="--load-extension=${ZEED_BUNDLED_EXT}"
fi

# shellcheck disable=SC2086
exec /opt/zeed-browser/zeed $ZEED_EXT_FLAGS $ZEED_USER_FLAGS "$@"
