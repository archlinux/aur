#!/usr/bin/env bash

LD_LIBRARY_PATH=/usr/lib/snoopy
export LD_LIBRARY_PATH

/usr/share/snoopy/snoopy "$@"
