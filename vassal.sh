#!/bin/bash

shopt -s nullglob

JAVA_BIN="$(which java)"

cd /usr/share/java/vassal && "${JAVA_BIN}" -classpath lib/Vengine.jar VASSAL.launch.ModuleManager "$@"
