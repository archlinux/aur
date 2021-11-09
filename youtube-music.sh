#!/bin/bash

export ELECTRON_IS_DEV=0
exec electron /usr/lib/youtube-music/app.asar "$@"
