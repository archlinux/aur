#!/usr/bin/env bash

export APPDIR=/usr/lib/wifi-audio-streaming

java_options=(
  "-Dcompose.application.resources.dir=$APPDIR/resources"
  "-Dcompose.application.configure.swing.globals=true"
  "-Djava.net.preferIPv4Stack=true"
  "-Dskiko.library.path=$APPDIR"
)

java "${java_options[@]}" \
  -cp "$APPDIR"/WiFiAudioStreaming-*.jar:"$APPDIR/*" MainKt
