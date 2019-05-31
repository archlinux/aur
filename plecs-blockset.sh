#!/bin/sh

export LD_LIBRARY_PATH=/opt/plecs-blockset/
unset QT_PLUGIN_PATH

exec /opt/plecs-blockset/bin/glnxa64/PLECS.setup $@
