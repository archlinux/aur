#!/bin/sh

if [ "${XDG_SESSION_TYPE}" == "wayland" ]; then
	unset DISPLAY
	ELECTRON_RUN_AS_NODE=1 exec @ELECTRON@ /usr/lib/vscodium/out/cli.js /usr/lib/vscodium/vscodium.js --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
else
	ELECTRON_RUN_AS_NODE=1 exec @ELECTRON@ /usr/lib/vscodium/out/cli.js /usr/lib/vscodium/vscodium.js "$@"
fi
