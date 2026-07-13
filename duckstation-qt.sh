#!/bin/sh

# xdg-desktop-portal isn't guaranteed to be installed or running on Arch. When
# it's missing, Qt's QGenericUnixServices fails to activate
# org.freedesktop.portal.Desktop over D-Bus and prints "Failed to register with
# host portal" on every startup. Skip the portal integration unless the service
# is actually available, so systems with a working portal keep its dialogs.
if [ "$(busctl --user call org.freedesktop.DBus /org/freedesktop/DBus \
        org.freedesktop.DBus NameHasOwner s org.freedesktop.portal.Desktop \
        2>/dev/null)" != "b true" ]; then
    export QT_NO_XDG_DESKTOP_PORTAL=1
fi

exec /usr/lib/duckstation/duckstation-qt "$@"
