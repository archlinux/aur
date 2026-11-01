#!/bin/sh
# Launcher for Battles of Brass (BOB).
#
# The game extracts its resources (config, flags, maps, ...) next to its own
# JAR at startup. /usr is read-only for normal users, so the JAR is copied
# into a per-user data directory and started from there.

jar="/usr/share/java/battles-of-brass/BOB-main.jar"
datadir="${XDG_DATA_HOME:-$HOME/.local/share}/bob"

mkdir -p "$datadir" || exit 1

# Refresh the user copy whenever the packaged JAR changes (package update)
if ! cmp -s "$jar" "$datadir/BOB-main.jar"; then
    cp -f "$jar" "$datadir/BOB-main.jar" || exit 1
fi

cd "$datadir" || exit 1

# BOB_JAVA_OPTS can be used for additional JVM flags (e.g. -Xmx4g)
# shellcheck disable=SC2086
exec java \
    --enable-native-access=ALL-UNNAMED \
    --add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED \
    $BOB_JAVA_OPTS \
    -jar "$datadir/BOB-main.jar" "$@"
