#!/bin/sh
export ELECTRON_IS_DEV=0
cd /usr/lib/hhd-ui
exec electron@electronversion@ /usr/lib/hhd-ui/app.asar $@
