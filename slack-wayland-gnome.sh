#!/bin/sh

if [ "${XDG_SESSION_TYPE}" = "wayland" ]; then
	exec electron17 /usr/lib/slack/app.asar --enable-features=UseOzonePlatform,WaylandWindowDecorations,WebRTCPipeWireCapturer --ozone-platform=wayland "$@"
else
	exec electron17 /usr/lib/slack/app.asar "$@"
fi


