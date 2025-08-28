#!/bin/sh

exec electron@ELECTRON_VERSION@ /usr/lib/slack/resources/app.asar "$@"
