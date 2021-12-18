#!/bin/bash

export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
_FC_PATH=/usr/share/java/freecol-git
exec java -Xms4096M -Xmx4096M -jar $_FC_PATH/FreeCol.jar --freecol-data $_FC_PATH/data "$@"
