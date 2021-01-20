#!/bin/bash

if [ "${XDG_SESSION_TYPE}" == "wayland" ]; then
    ELECTRON_RUN_AS_NODE=1 exec electron /usr/lib/code-wayland/out/cli.js /usr/lib/code-wayland/code.js --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
else
    ELECTRON_RUN_AS_NODE=1 exec electron /usr/lib/code-wayland/out/cli.js /usr/lib/code-wayland/code.js "$@"
fi
