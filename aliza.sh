#!/bin/sh
# Qt5's default GLX integration renders a black window on XWayland
# (seen with the NVIDIA driver); EGL works. Can be overridden by the user.
export QT_XCB_GL_INTEGRATION="${QT_XCB_GL_INTEGRATION:-xcb_egl}"
exec /usr/lib/aliza/aliza "$@"
