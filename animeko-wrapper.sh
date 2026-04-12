#!/bin/sh

_appimage='/opt/animeko/animeko.AppImage'
_fixlib='/opt/animeko/libanimeko-setenv-fix.so'

if [ -r "${_fixlib}" ]; then
  if [ -n "${LD_PRELOAD-}" ]; then
    export LD_PRELOAD="${_fixlib}:${LD_PRELOAD}"
  else
    export LD_PRELOAD="${_fixlib}"
  fi
fi

# Fallback for environments without usable FUSE support.
if [ ! -c /dev/fuse ] || { ! command -v fusermount >/dev/null 2>&1 && ! command -v fusermount3 >/dev/null 2>&1; }; then
  export APPIMAGE_EXTRACT_AND_RUN=1
fi

exec "${_appimage}" "$@"
