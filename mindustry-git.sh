#!/bin/sh
NAME=mindustry-git
cd ${XDG_DATA_HOME:"$HOME/.local/share"}/"$NAME"
exec /usr/bin/java -jar /usr/share/java/$NAME/desktop-release.jar "$@"
