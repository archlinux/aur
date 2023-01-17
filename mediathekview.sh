#!/bin/sh

# Handle data directory to be compliant to XDG Base Directory specification.
data_directory="${XDG_DATA_HOME:-$HOME/.local/share}/mediathekview"
upstream_default="$HOME/.mediathek3"
if [ -d "$upstream_default" ] && [ ! -d "$data_directory" ]; then
  # migrate existing data
  mv -v "$upstream_default" "$data_directory"
fi

PATH="/usr/lib/jvm/java-17-openjdk/bin:${PATH}"
# requires preview features: https://github.com/mediathekview/MediathekView/issues/528
java -jar /usr/share/java/mediathekview/MediathekView.jar "$@" "$data_directory"
