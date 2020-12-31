#!/bin/bash

# workaround for init.json issue
cd "$HOME/.config/glowing-bear"
mkdir -p "$HOME/.config/glowing-bear"

# start electron glowing-bear
exec electron /usr/lib/glowing-bear/webapp/electron-main.js "${@}"
