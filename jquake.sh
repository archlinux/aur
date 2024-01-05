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

# The app store temporary files, such as errors.log
JTMP=$(mktemp -p /tmp -d jquake.XXX)
cd $JTMP
# It also need a ugly symlink for sounds
ln -s /usr/share/jquake/sounds sounds
java -cp $CP -Xmx200m -Xms32m -Xmn2m -Djava.net.preferIPv4Stack=true -Dsun.sound.useNewAudioEngine="false" net.jquake.app.Main
