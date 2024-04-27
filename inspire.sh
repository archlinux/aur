#!/bin/bash

# This script launches ActivInspire. It is partially based on the upstream launch script, with obsolete and Ubuntu-specific stuff fixed or removed.

cd /opt/activsoftware

# Promethean ships ActivInspire with a bunch of libraries. We can't recompile it and there are less problems when using these library versions.
export LD_LIBRARY_PATH="/opt/activsoftware:$LD_LIBRARY_PATH"
#export QTWEBENGINEPROCESS_PATH="/opt/activsoftware/QtWebEngineProcess"

# Launch and open the file if one was given as an argument.
./Inspire "$@"

# This is a lock file. Since ActivInspire hangs when attempting to close it, it never gets deleted, causing problems.
rm -f /dev/shm/sem.promethean
