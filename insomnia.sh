#!/bin/sh

cd /usr/lib/insomnia
exec @ELECTRON@ resources/app.asar "$@"
