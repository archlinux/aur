#!/bin/sh

NETRUNNER_DIR="$HOME"/.local/share/netrunner

[[ ! -d $NETRUNNER_DIR ]] && mkdir -p $NETRUNNER_DIR
[[ ! -f $NETRUNNER_DIR/netrunner ]] && cp /usr/share/netrunner/netrunner $NETRUNNER_DIR/netrunner

exec $NETRUNNER_DIR/netrunner
