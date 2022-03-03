#!/bin/sh

if [ "${XDG_SESSION_TYPE}" = "wayland" ]; then
	exec electron16 /usr/lib/slack/app.asar --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer --ozone-platform=wayland "$@"
else
	exec electron16 /usr/lib/slack/app.asar "$@"
fi


