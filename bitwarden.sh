#!/bin/sh
export ELECTRON_IS_DEV=0
cd /usr/lib/bitwarden
exec electron14 /usr/lib/bitwarden/app.asar $@
