#!/usr/bin/env bash
/usr/lib/theia-electron/node_modules/.bin/electron /usr/lib/theia-electron \
    "--plugins=local-dir:/usr/lib/theia-electron/plugins" \
    "$@"