#!/usr/bin/env bash
set -euo pipefail

# Define CLASSPATH
CP=""
for name in /usr/share/java/jquake/*.jar; do
  CP=$CP:$name
done

# The app stores its settings (Settings.properties) and errors.log
# in the working directory, so run from a persistent per-user directory
JDATA="${XDG_DATA_HOME:-$HOME/.local/share}/jquake"
mkdir -p "$JDATA"
cd "$JDATA"
# It also needs a ugly symlink for sounds
ln -sfn /usr/share/jquake/sounds sounds

# The app defaults its settings directory to the macOS path even on Linux,
# recorded in SettingsPath.properties: point it here instead, migrating any
# settings already saved to the macOS-style location
LEGACY="$HOME/Library/Application Support/JQuake"
if [ ! -e SettingsPath.properties ] || [ "$(cat SettingsPath.properties)" = "$LEGACY" ]; then
  if [ -d "$LEGACY" ]; then
    mv -n "$LEGACY"/*.properties "$JDATA/" 2>/dev/null || true
    rmdir "$LEGACY" "$HOME/Library/Application Support" "$HOME/Library" 2>/dev/null || true
  fi
  printf '%s' "$JDATA" > SettingsPath.properties
fi
exec /usr/bin/java -cp "$CP" -Xmx200m -Xms32m -Xmn2m -Djava.net.preferIPv4Stack=true -Dsun.sound.useNewAudioEngine="false" net.jquake.app.Main
