#!/usr/bin/bash

exec @ELECTRON@ /usr/lib/tabby/app.asar --no-sandbox "${@}"
