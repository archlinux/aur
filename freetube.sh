#!/bin/sh

if [ "${XDG_SESSION_TYPE}" == "wayland" ]; then
	exec electron16 /usr/lib/freetube/app.asar --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
else
	exec electron16 /usr/lib/freetube/app.asar "$@"
fi

