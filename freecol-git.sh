#!/bin/bash

_FC_PATH=/usr/share/java/freecol-git
exec "$JAVA_HOME/bin/java" -Xms4096M -Xmx4096M -jar $_FC_PATH/FreeCol.jar --freecol-data $_FC_PATH/data "$@"
