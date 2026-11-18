#!/bin/sh
# Upstream defaults: ZCode user data under ~/.config/ZCode, system locale and
# the Z.ai providers in the order the official build ships them. --class only
# affects the Wayland app_id (Electron bakes the X11 WM_CLASS as "zcode"), so
# it names the window after this package's desktop file.
exec /opt/zcode/zcode --class=zcode-intl "$@"
