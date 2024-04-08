#!/bin/bash

# Handle data directory to be compliant to XDG Base Directory specification.
data_directory="${XDG_DATA_HOME:-$HOME/.local/share}/mediathekview"
upstream_default="$HOME/.mediathek3"
if [ -d "$upstream_default" ] && [ ! -d "$data_directory" ]; then
  # migrate existing data
  mv -v "$upstream_default" "$data_directory"
fi

java_options=(
  # the application enforces the use of certain JVM parameters:
  # https://github.com/mediathekview/MediathekView/blob/14.0.0/src/main/java/mediathek/Main.java#L286
  -XX:+UseShenandoahGC
  -XX:ShenandoahGCHeuristics=compact
  -XX:+UseStringDeduplication
  -XX:MaxRAMPercentage=25  # use the default 25%
  --add-opens=java.desktop/sun.awt.X11=ALL-UNNAMED
  -DexternalUpdateCheck  # disable automatic update check
  -jar /usr/share/java/mediathekview/MediathekView.jar
)
PATH="/usr/lib/jvm/java-JAVA_VERSION-openjdk/bin:${PATH}"

exec java "${java_options[@]}" "$@" "$data_directory"
