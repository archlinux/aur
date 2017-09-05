#!/bin/sh
export PATH="/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH"
exec /usr/bin/java \
  -Xmx512m \
  -Dlogback.configurationFile=/etc/cryptomator/logback.xml \
  -Dcryptomator.ipcPortPath=~/.Cryptomator/ipcPort.bin \
  -Dcryptomator.settingsPath=~/.Cryptomator/settings.json \
  -jar /usr/share/java/cryptomator/cryptomator.jar "$@"
