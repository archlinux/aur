#!/bin/sh -eu
SLACK_APP_PATH="${SLACK_APP_PATH:-/usr/lib/slack/app.asar}"
SLACK_ELECTRON_EXEC="${SLACK_ELECTRON_EXEC:-electron}"
SLACK_WAYLAND_FLAGS="${SLACK_WAYLAND_FLAGS:---enable-features=UseOzonePlatform --ozone-platform=wayland --enable-features=WebRTCPipeWireCapturer --enable-features=WaylandWindowDecorations}"

# shellcheck disable=SC2086
exec $SLACK_ELECTRON_EXEC $SLACK_WAYLAND_FLAGS $SLACK_APP_PATH "$@"
