#!/bin/sh
# CatPaw (overseas edition) Linux launcher.  The window class/app id comes from
# the application's own product name (catpaw-overseas), so the desktop entry and
# icon in this package use that identifier to make the dash icon resolve.
exec /opt/catpaw/catpaw \
  --no-sandbox \
  --disable-dev-shm-usage \
  --ozone-platform-hint=auto \
  --enable-wayland-ime \
  "$@"
