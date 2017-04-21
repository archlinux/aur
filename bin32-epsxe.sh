#!/usr/bin/env bash


LD_LIBRARY_PATH+=:/opt/bin32-epsxe LD_PRELOAD=/usr/lib32/libcurl.so.3 /opt/bin32-epsxe/bin32-epsxe "$@"
