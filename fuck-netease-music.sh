#!/usr/bin/env bash
set -euo pipefail

export APPIMAGE_EXTRACT_AND_RUN=1
exec /opt/fuck-netease-music/fuck-netease-music.AppImage "$@"
