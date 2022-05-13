#!/bin/sh

CONFIG="${XDG_CONFIG_HOME:=$HOME/.config}/apriltag-trackers/"
mkdir -p $CONFIG

[ ! -L "$CONFIG/bindings" ] && ln -s "/usr/share/apriltagtrackers/bindings/$1" "$CONFIG/"

cd $CONFIG
exec /usr/lib/apriltagtrackers/AprilTagTrackers