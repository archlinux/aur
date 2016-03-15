#!/usr/bin/env bash

#LD_LIBRARY_PATH+=:/opt/epsxe

LD_LIBRARY_PATH="$LD_LIBRARY_PATH":/opt/epsxe /opt/epsxe/epsxe "$@"
