#!/usr/bin/env bash
port="${1//[^0-9]/}"
port="${port:-4000}"
java -jar hsbox-PKG_VERSION-standalone.jar --port "$port"
