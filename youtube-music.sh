#!/bin/bash

export ELECTRON_IS_DEV=0
exec electron20 /usr/lib/youtube-music/app.asar "$@"
