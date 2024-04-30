#!/usr/bin/bash

if [[ "$1" != "-p" ]]; then
    WORKDIR=${XDG_CONFIG_HOME:-$HOME/.config}/OpenUtau
    mkdir -p $WORKDIR
    cd $WORKDIR
fi

exec /opt/openutau/OpenUtau
