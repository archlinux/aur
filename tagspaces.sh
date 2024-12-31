#!/usr/bin/bash

exec @ELECTRON@ /usr/lib/tagspaces/app.asar --no-sandbox "$@"
