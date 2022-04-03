#!/bin/sh
export ELECTRON_IS_DEV=0
cd /usr/lib/remnote
exec electron17 /usr/lib/remnote/app.asar $@
