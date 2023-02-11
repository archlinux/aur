#!/usr/bin/env bash

ORSC_CACHE_DIR="${HOME}/.local/share/openrsc-launcher"
ORSC_JAR="/usr/share/java/openrsc-launcher/OpenRSC.jar"

# create cache dir if it doesn't exist
if [ ! -d "${ORSC_CACHE_DIR}" ]; then
  mkdir -p "${ORSC_CACHE_DIR}"
fi

cd "${ORSC_CACHE_DIR}"

java -jar "${ORSC_JAR}"
