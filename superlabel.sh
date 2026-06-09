#!/bin/sh
export WEBKIT_DISABLE_DMABUF_RENDERER="${WEBKIT_DISABLE_DMABUF_RENDERER:-1}"

if [ -n "${SUPERLABEL_FORCE_X11:-}" ]; then
  export GDK_BACKEND="${GDK_BACKEND:-x11}"
fi

exec /opt/superlabel/superlabel.AppImage "$@"
