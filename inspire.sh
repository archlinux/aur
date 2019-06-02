#!/bin/bash

# This script launches ActivInspire. It is partially based on the upstream launch script, with obsolete and Ubuntu-specific stuff fixed or removed.

cd /usr/bin/activsoftware

# Promethean software has a bug that often causes it to hang when attempting to close it using the GUI. So we need to kill those instances before launching a new one.
killall -q Inspire

# ActivInspire needs 32-bit Java for the equation editor (see optional dependencies).
export JAVA_HOME=/usr/lib32/jvm/java32-8-jre/jre

# Promethean ships ActivInspire with a bunch of libraries. We can't recompile it and there are less problems when using this library versions.
export LD_LIBRARY_PATH="/usr/bin/activsoftware:/usr/bin/activsoftware/workbench:/usr/bin/activsoftware/workbench/lib:/usr/bin/activsoftware/32bit_libs_for_64bit_OS:$LD_LIBRARY_PATH"
export GST_PLUGIN_PATH="/usr/bin/activsoftware/32bit_libs_for_64bit_OS:$GST_PLUGIN_PATH"
export QTWEBKIT_PLUGIN_PATH="/usr/bin/activsoftware/32bit_libs_for_64bit_OS:$QTWEBKIT_PLUGIN_PATH"

./Inspire "$@"
