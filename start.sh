#!/bin/sh

currentDir=$(dirname $0)
/usr/lib/jvm/java-8-openjdk/bin/java -jar "$(dirname $0)"/jpk/TransmitterLauncher.lib
