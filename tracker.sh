#!/bin/bash
export TRACKER_HOME=/opt/tracker
/usr/lib/jvm/default-runtime/bin/java -jar $TRACKER_HOME/tracker_starter.jar $*
