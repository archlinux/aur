#!/bin/bash

if [[ "$1" != "-p" ]]; then
  WORKDIR=${XDG_CONFIG_HOME:-$HOME/.config}/hello-minecraft-launcher
  mkdir -p $WORKDIR
  cd $WORKDIR
fi

exec java -jar /usr/share/java/hello-minecraft-launcher-dev-bin/hello-minecraft-launcher-dev-bin.jar "$@"