#!/bin/sh
exec env ELECTRON_IS_DEV=0 electron /usr/share/satisfactory-mod-manager/resources/app.asar $@
