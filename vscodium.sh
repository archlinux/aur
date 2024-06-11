#!/bin/sh

if [ "${XDG_SESSION_TYPE}" = "wayland" ]; then
   unset DISPLAY
   exec @ELECTRON@ /usr/lib/vscodium/out/cli.js --enable-features=UseOzonePlatform --ozone-platform=wayland /usr/lib/vscodium/vscodium.js "$@"
else
   ELECTRON_RUN_AS_NODE=1 exec @ELECTRON@ /usr/lib/vscodium/out/cli.js /usr/lib/vscodium/vscodium.js "$@"
fi
