#!/bin/sh

CONFIG="${XDG_CONFIG_HOME:=$HOME/.config}/apriltag-trackers/"

mkdir -p $CONFIG

(cd $CONFIG; /usr/lib/apriltagtrackers/AprilTagTrackers)