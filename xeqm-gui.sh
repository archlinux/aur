#!/bin/bash
export LD_LIBRARY_PATH="/opt/xeqm-gui/usr/lib:$LD_LIBRARY_PATH"
exec /opt/xeqm-gui/xeqm-gui --no-sandbox "$@"
