#!/bin/bash

if [ "${XDG_SESSION_TYPE}" == "wayland" ]; then
    ELECTRON_RUN_AS_NODE=1 exec electron /usr/lib/vscode/out/cli.js /usr/lib/vscode/code.js --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
else
    ELECTRON_RUN_AS_NODE=1 exec electron /usr/lib/vscode/out/cli.js /usr/lib/vscode/code.js "$@"
fi
