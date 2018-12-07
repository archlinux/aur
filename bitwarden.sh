#!/bin/sh 
export ELECTRON_IS_DEV=0
electron2 /usr/lib/bitwarden/resources/app.asar $@
