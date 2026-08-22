#!/bin/sh
# Chromium bundles fontconfig 2.17; Arch's caches are from 2.18+.
# Skip the version check so the app does not warn on every launch.
export FONTCONFIG_NO_CHECK_CACHE_VERSION=1
exec "/opt/Grok Bot/grok-bot" "$@"
