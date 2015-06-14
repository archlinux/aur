#!/bin/bash

# Allow users to override command-line options
if [[ -f ~/.config/chromium-flags.conf ]]; then
   CHROMIUM_USER_FLAGS="$(cat ~/.config/chromium-flags.conf)"
fi

# Detect Pepper Flash
for i in '/opt/google/chrome-unstable' '/usr/lib'; do
   if [[ -f $i/PepperFlash/libpepflashplayer.so ]]; then
      PepperFlash="$i/PepperFlash/libpepflashplayer.so"
      PepperFlashVersion="$(grep 'version' $i/PepperFlash/manifest.json | cut -d '"' -f4)"
      
      CHROMIUM_USER_FLAGS+=" --ppapi-flash-path=$PepperFlash --ppapi-flash-version=$PepperFlashVersion"
      continue
   fi
done

export CHROME_WRAPPER=$(readlink -f "$0")
export CHROME_DESKTOP="chromium-snapshot-bin.desktop"

# Launch
exec /opt/chromium-snapshot/chrome $CHROMIUM_USER_FLAGS "$@"