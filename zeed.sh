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

# Default chromium flags applied before user flags so users can override
# them via ~/.config/zeed-flags.conf.
#
# --disable-features=TreesInViz: works around an upstream Chromium 147
# GPU-process FATAL (cc/trees/layer_tree_host_impl.cc CHECK
# viz_damage_rect.Contains(root_layer_damage_rect_), crbug.com/454680865).
# Remove once JellyMander Phase 1a stabilizes upstream.
ZEED_DEFAULT_FLAGS="--disable-features=TreesInViz"

# shellcheck disable=SC2086
exec /opt/zeed-browser/zeed $ZEED_EXT_FLAGS $ZEED_DEFAULT_FLAGS $ZEED_USER_FLAGS "$@"
