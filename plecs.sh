#!/bin/sh

export LD_LIBRARY_PATH=/opt/plecs/
unset QT_PLUGIN_PATH

exec /opt/plecs/PLECS.bin $@
