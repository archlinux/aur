#!/usr/bin/env bash


LD_LIBRARY_PATH+=:/opt/epsxe LD_PRELOAD=/usr/lib32/libcurl.so.3 /opt/epsxe/epsxe "$@"
