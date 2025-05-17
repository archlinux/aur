#!/bin/sh

exec electron@ELECTRON_VERSION@ --gtk-version=3 /usr/lib/slack/resources/app.asar "$@"
