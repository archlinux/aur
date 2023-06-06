#!/usr/bin/env bash
java \
  -Dtlauncher.bootstrap.targetLibFolder=/opt/legacylauncher/lib \
  -Dtlauncher.bootstrap.packageMode=aur \
  -Dtlauncher.bootstrap.targetJar=/opt/legacylauncher/launcher.jar \
  -jar \
  /opt/legacylauncher/bootstrap.jar \
  "$@"

