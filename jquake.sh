#!/usr/bin/env bash
set -euo pipefail

# Define CLASSPATH
CP=""
for name in /usr/share/java/jquake/*.jar; do
  CP=$CP:$name
done
for name in /usr/lib/jquake/*.jar; do
  CP=$CP:$name
done

# The app stores its settings (Settings.properties) and errors.log
# in the working directory, so run from a persistent per-user directory
JDATA="${XDG_DATA_HOME:-$HOME/.local/share}/jquake"
mkdir -p "$JDATA"
cd "$JDATA"
# It also needs a ugly symlink for sounds
ln -sfn /usr/share/jquake/sounds sounds
exec java -cp "$CP" -Xmx200m -Xms32m -Xmn2m -Djava.net.preferIPv4Stack=true -Dsun.sound.useNewAudioEngine="false" net.jquake.app.Main
