#!/bin/sh
set -e
_RUNNAME=/usr/bin/@runname@
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec "${_RUNNAME}" "$@"