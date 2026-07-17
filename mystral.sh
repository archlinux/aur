#!/usr/bin/env sh
# A wrapper for the mystral command located in /opt/mystralnative.
# We set the current PATH to only point to /usr/bin:/bin, and LD_LIBRARY_PATH gets set to /opt/mystralnative as well.

PATH=/usr/bin:/bin
LD_LIBRARY_PATH=/opt/mystralnative
export PATH
export LD_LIBRARY_PATH

/usr/bin/env -u WAYLAND_DISPLAY \
	SDL_VIDEODRIVER=x11 \
	GDK_BACKEND=x11 \
	/opt/mystralnative/mystral "$@"
