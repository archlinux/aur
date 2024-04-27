#!/bin/bash

# This script launches ActivPlayer. It is partially based on the upstream launch script, with obsolete and Ubuntu-specific stuff fixed or removed.

cd /opt/activsoftware

# Promethean ships ActivInspire with a bunch of libraries. We can't recompile it and there are less problems when using these library versions.
export LD_LIBRARY_PATH="/opt/activsoftware:$LD_LIBRARY_PATH"

# Launch and open the file if one was given as an argument.
./activplayer "$@"
