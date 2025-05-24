#!/bin/sh

if [ -n "$FAKEZIG_CACHE_DIR" ]; then
  FAKEZIG_ZIGUP_THRESHOLD="2025_04_20" # https://github.com/marler8997/zigup/releases/tag/v2025_04_20
  FAKEZIG_ZIGUP_VERSION="$(pacman -Q zigup 2>/dev/null | awk '{print $2}')"
  if [ "$(vercmp "$FAKEZIG_ZIGUP_VERSION" "$FAKEZIG_ZIGUP_THRESHOLD")" -ge 0 ]; then
    env XDG_DATA_HOME="$FAKEZIG_CACHE_DIR" zigup fetch @VERSION@
    exec env XDG_DATA_HOME="$FAKEZIG_CACHE_DIR" zigup run @VERSION@ "$@"
  else
    mkdir -p "$FAKEZIG_CACHE_DIR/zigup-old" # "$FAKEZIG_CACHE_DIR/zigup"
    # ln -sf "$FAKEZIG_CACHE_DIR/zigup" "$FAKEZIG_CACHE_DIR/zigup-old/zig"
    env HOME="$FAKEZIG_CACHE_DIR/zigup-old" zigup fetch @VERSION@
    exec env HOME="$FAKEZIG_CACHE_DIR/zigup-old" zigup run @VERSION@ "$@"
  fi
else
  zigup fetch @VERSION@
  exec zigup run @VERSION@ "$@"
fi
