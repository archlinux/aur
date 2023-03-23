#!/bin/sh
export ELECTRON_IS_DEV=0
cd /usr/lib/joplin
exec electron@electronversion@ /usr/lib/joplin/app.asar $@
