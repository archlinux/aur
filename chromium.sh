#!/bin/sh
export PATH=$PATH:/usr/lib/chromium
export CHROME_WRAPPER=/usr/lib/chromium/chromium
export CHROME_DESKTOP=chromium.desktop
exec /usr/lib/chromium/chromium $@
