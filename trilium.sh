#!/bin/sh
export ELECTRON_IS_DEV=0
cd /usr/lib/trilium
exec electron@electronversion@ app.asar $@
