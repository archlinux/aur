#!/bin/sh
# Prefer native Wayland when running under a Wayland session; fall back to X11
# otherwise. Override via PASEO_FLAGS (e.g. PASEO_FLAGS=--ozone-platform=x11).
exec /opt/Paseo/Paseo \
    --ozone-platform-hint=auto \
    --enable-wayland-ime \
    ${PASEO_FLAGS} \
    "$@"
