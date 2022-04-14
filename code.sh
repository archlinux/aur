#!/bin/bash

# don't edit the electron binary name here! simply change the variable in the PKGBUILD and we will sed it into the correct one :)

if [ "${XDG_SESSION_TYPE}" == "wayland" ]; then
    ELECTRON_RUN_AS_NODE=1 exec electron17 /usr/lib/code-wayland/out/cli.js /usr/lib/code-wayland/code.js --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
else
    ELECTRON_RUN_AS_NODE=1 exec electron17 /usr/lib/code-wayland/out/cli.js /usr/lib/code-wayland/code.js "$@"
fi
