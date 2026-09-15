#!/bin/sh
# Starts Modrinth Enhanced with the vblank shim preloaded (see vblank-shim.c).
# With the NVIDIA driver the shim only lifts the frame rate under X11, so it is
# asked to keep GTK on X11 there. MODRINTH_VBLANK_SHIM=0 starts the app without.
if [ "${MODRINTH_VBLANK_SHIM:-1}" != 0 ]; then
  [ -d /sys/module/nvidia_drm ] && export VBLANK_SHIM_GDK_BACKEND=x11
  export LD_PRELOAD="/usr/lib/modrinth-enhanced/libwebkit-vblank-shim.so${LD_PRELOAD:+:$LD_PRELOAD}"
fi
exec /usr/lib/modrinth-enhanced/ModrinthEnhanced "$@"
