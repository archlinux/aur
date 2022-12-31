#!/bin/sh

PATH="/usr/lib/jvm/java-17-openjdk/bin:${PATH}"
directory="${XDG_DATA_HOME:-$HOME/.local/share}/mediathekview"
# requires preview features: https://github.com/mediathekview/MediathekView/issues/528
java -jar /usr/share/java/mediathekview/MediathekView.jar "$@" "$directory"
