#!/bin/sh

# NVIDIA check using lsmod to detect loaded kernel modules
if lsmod | grep -q '^nvidia '; then
    export WEBKIT_DISABLE_DMABUF_RENDERER=1
fi

exec /usr/lib/kanri "$@"
