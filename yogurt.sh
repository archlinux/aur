#!/bin/sh
# X11 through XWayland unless the arguments name a platform, as upstream's
# AppImage launcher does: the app skips its own relaunch onto X11 when
# electron-flags.conf passes an --ozone-platform-hint
case " $* " in *" --ozone-platform"*) ;; *)
  [ -n "$WAYLAND_DISPLAY" ] && [ -n "$DISPLAY" ] && set -- --ozone-platform=x11 "$@" ;;
esac
# the app takes an inherited $APPIMAGE for its own, and its speech and notes
# engines load backend libraries from the working directory
unset APPIMAGE APPDIR
cd /
exec @ELECTRON@ /usr/lib/yogurt "$@"
