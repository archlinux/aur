#!/usr/bin/env bash


LD_LIBRARY_PATH+=:/opt/epsxe LD_PRELOAD=/usr/lib/libcurl.so.3 /opt/epsxe/epsxe "$@"
