#!/bin/bash

exec electron@ELECTRONVERSION@ /usr/lib/android-messages-desktop/resources/app.asar --ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --gtk-version=3 --no-sandbox"$@"
