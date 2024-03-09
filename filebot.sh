#!/usr/bin/env bash
FILEBOT_HOME="/usr/share/filebot"

# sanity check
if [ -z "${HOME}" ]; then
  echo "\$HOME must be set"
  exit 1
fi

if [ "$(id -u)" = "0" ]; then
  echo "$0 must NOT run as root"
fi

# select application data folder
APP_DATA="${HOME}/.config/filebot"
LIBRARY_PATH="${FILEBOT_HOME}/lib/$(uname -m):/lib64"

# Disable wayland and force xwayland
# workaround for bug https://www.filebot.net/forums/viewtopic.php?t=13567
# as of 09.03.2024 seems relevant under KDE 6.0 using Wayland and nvidia/amd gpu
WAYLAND_DISPLAY=

# shellcheck disable=SC2086
java \
  -Dapplication.deployment=aur \
  --add-modules ALL-MODULE-PATH \
  -Dnet.filebot.archive.extractor=ShellExecutables \
  --add-opens=java.base/java.lang=ALL-UNNAMED \
  --add-opens=java.base/java.lang.reflect=ALL-UNNAMED \
  --add-opens=java.base/java.lang.invoke=ALL-UNNAMED \
  --add-opens=java.base/java.util=ALL-UNNAMED \
  --add-opens=java.base/java.util.function=ALL-UNNAMED \
  --add-opens=java.base/java.util.regex=ALL-UNNAMED \
  --add-opens=java.base/java.net=ALL-UNNAMED \
  --add-opens=java.base/java.io=ALL-UNNAMED \
  --add-opens=java.base/java.nio=ALL-UNNAMED \
  --add-opens=java.base/java.nio.file=ALL-UNNAMED \
  --add-opens=java.base/java.nio.file.attribute=ALL-UNNAMED \
  --add-opens=java.base/java.nio.channels=ALL-UNNAMED \
  --add-opens=java.base/java.nio.charset=ALL-UNNAMED \
  --add-opens=java.base/java.time=ALL-UNNAMED \
  --add-opens=java.base/java.time.chrono=ALL-UNNAMED \
  --add-opens=java.base/java.util.concurrent=ALL-UNNAMED \
  --add-opens=java.base/java.text=ALL-UNNAMED \
  --add-opens=java.base/sun.nio.fs=ALL-UNNAMED \
  --add-opens=java.logging/java.util.logging=ALL-UNNAMED \
  --add-opens=java.desktop/java.awt=ALL-UNNAMED \
  --add-opens=java.desktop/sun.awt=ALL-UNNAMED \
  --add-opens=java.desktop/sun.swing=ALL-UNNAMED \
  --add-opens=java.desktop/javax.swing.text.html=ALL-UNNAMED \
  --add-opens=java.prefs/java.util.prefs=ALL-UNNAMED \
  -XX:+DisableAttachMechanism \
  -Djna.boot.library.path="${LIBRARY_PATH}" \
  -Djna.boot.library.name=jnidispatch \
  -Djna.library.path="${LIBRARY_PATH}" \
  -Djava.library.path="${LIBRARY_PATH}" \
  -Dapplication.dir="${APP_DATA}" \
  -Dapplication.cache="${APP_DATA}/cache" \
  -Djava.io.tmpdir="${APP_DATA}/tmp" \
  -Dfile.encoding="UTF-8" \
  -Dsun.jnu.encoding="UTF-8" \
  -Dawt.useSystemAAFontSettings=on \
  -Dprism.order=sw \
  -Dnet.filebot.theme=Darcula \
  -DuseGVFS=true \
  -Dnet.filebot.gio.GVFS="${XDG_RUNTIME_DIR}/gvfs" \
  ${JVM_OPTS} ${JAVA_OPTS} ${FILEBOT_OPTS} \
  -jar "${FILEBOT_HOME}/jar/filebot.jar" \
  "$@"
