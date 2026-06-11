#!/bin/sh
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"
export WEBKIT_DISABLE_COMPOSITING_MODE="${WEBKIT_DISABLE_COMPOSITING_MODE:-1}"

if [ -n "${SUPERLABEL_FORCE_X11:-}" ] || \
   { [ -z "${SUPERLABEL_USE_WAYLAND:-}" ] && [ "${XDG_SESSION_TYPE:-}" = "wayland" -o -n "${WAYLAND_DISPLAY:-}" ]; }; then
  export GDK_BACKEND="${GDK_BACKEND:-x11}"
fi

exec /opt/superlabel/superlabel "$@"
