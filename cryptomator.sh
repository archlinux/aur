#!/bin/sh
export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
exec /usr/bin/java \
  -Xmx512m \
  -Dcryptomator.logPath=~/.Cryptomator/cryptomator.log \
  -Dcryptomator.upgradeLogPath=~/.Cryptomator/upgrade.log \
  -Dcryptomator.settingsPath=~/.Cryptomator/settings.json \
  -jar /usr/share/java/cryptomator/cryptomator.jar "$@"
