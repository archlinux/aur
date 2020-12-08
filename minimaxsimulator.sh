#!/bin/sh
exec /usr/bin/java -Djdk.gtk.version=2 -jar '/usr/share/java/minimaxsimulator/minimax_simulator.jar' "$@"
