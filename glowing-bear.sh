#!/bin/bash

# workaround for init.json issue
mkdir -p "$HOME/.config/glowing-bear"
cd "$HOME/.config/glowing-bear"

# set node_modules path
export NODE_PATH="/usr/lib/glowing-bear/node_modules"

# start electron glowing-bear
exec electron /usr/lib/glowing-bear/webapp/electron-main.js "${@}"
