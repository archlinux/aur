#!/bin/sh
firejail --profile=/etc/firejail/chromium.profile /usr/lib/ungoogled-chromium/chrome --no-sandbox
