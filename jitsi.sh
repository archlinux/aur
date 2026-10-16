#!/bin/bash

SCDIR=/usr/share/jitsi

SPLASH_ARG="-splash:${SCDIR}/splash.gif"
for arg in "$@"; do
  [[ $arg == --splash=no ]] && SPLASH_ARG=""
done

exec archlinux-java-run --min 11 -- \
  -cp "${SCDIR}/lib/*:${SCDIR}/config/" \
  -Djava.library.path=/usr/lib/jitsi \
  --add-opens=java.base/jdk.internal.loader=ALL-UNNAMED \
  --add-opens=java.base/java.lang=ALL-UNNAMED \
  ${SPLASH_ARG} \
  ${JITSI_EXTRA_ARGS} \
  net.java.sip.communicator.launcher.Jitsi \
  "$@"
