#!/bin/bash

export PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH"
# While freecol can be run with openjdk11 or later, running it with openjdk 11 is preferred.
# The above export PATH ensures that if openjdk 11 is present it will be found & used.
_FC_PATH=/usr/share/java/freecol-git
exec java -Xms4096M -Xmx4096M -jar $_FC_PATH/FreeCol.jar --freecol-data $_FC_PATH/data "$@"
# freecol used to run slow and with problems on systems where it didn't get enough memory.
# This has been improved in recent versions but it still runs better with more memory available.
