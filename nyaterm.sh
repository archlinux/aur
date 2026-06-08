#!/bin/sh
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec /usr/lib/nyaterm-bin/nyaterm "$@"
