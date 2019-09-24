#!/bin/bash

# This script launches ActivPlayer. It is partially based on the upstream launch script, with obsolete and Ubuntu-specific stuff fixed or removed.

cd /opt/activsoftware/workbench

# Promethean software has a bug that often causes it to hang when attempting to close it using the GUI. So we need to kill those instances before launching a new one.
killall -q activplayer

# Promethean ships ActivInspire with a bunch of libraries. We can't recompile it and there are less problems when using this library versions.
export LD_LIBRARY_PATH="/opt/activsoftware:/opt/activsoftware/workbench:/opt/activsoftware/workbench/lib:/opt/activsoftware/32bit_libs_for_64bit_OS:$LD_LIBRARY_PATH"
export GST_PLUGIN_PATH="/opt/activsoftware/32bit_libs_for_64bit_OS:$GST_PLUGIN_PATH"
export QTWEBKIT_PLUGIN_PATH="/opt/activsoftware/32bit_libs_for_64bit_OS:$QTWEBKIT_PLUGIN_PATH"

# Launch and open the file if one was given as an argument.
./activplayer "$@"