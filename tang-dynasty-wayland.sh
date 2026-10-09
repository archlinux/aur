#!/bin/sh

TD=/opt/tang-dynasty-bin
QTWL=/opt/tang-dynasty-wayland

# Keep TD's customized Qt, adding only the matching QtWayland client module.
export LD_LIBRARY_PATH="$QTWL/lib:$TD/lib:$TD/lib/Qt/lib"
export QT_PLUGIN_PATH="$QTWL/plugins:$TD/lib/Qt/plugins"
export QT_QPA_PLATFORM_PLUGIN_PATH="$QTWL/plugins/platforms"
unset QT_QPA_PLATFORMTHEME
# An explicit xcb override is possible, but never silently fall back to XWayland.
export QT_QPA_PLATFORM="${QT_QPA_PLATFORM:-wayland}"

if [ -z "${QT_IM_MODULE+x}" ] && \
   [ -r "$QTWL/plugins/platforminputcontexts/libfcitx5platforminputcontextplugin.so" ]; then
  export QT_IM_MODULE=fcitx
fi

if [ "$#" -eq 0 ]; then
  set -- -gui
fi
exec "$TD/bin/td" "$@"
