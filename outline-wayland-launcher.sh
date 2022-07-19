#!/bin/bash

OUTLINE="/opt/outline-client/Outline-Client.AppImage"

if [ "$XDG_SESSION_TYPE" = wayland ]; then
  exec $OUTLINE "--disable-gpu" \$@
else
  # Using x11
  exec $OUTLINE \$@
fi
