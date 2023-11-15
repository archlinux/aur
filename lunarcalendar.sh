#!/bin/bash
set -e
INSTALL_PATH=/opt/lunarcalendar
export LD_LIBRARY_PATH="$INSTALL_PATH/bin:$INSTALL_PATH/lib:$INSTALL_PATH/lib/`uname -m`-linux-gnu:$LD_LIBRARY_PATH"
exec $INSTALL_PATH/bin/LunarCalendarApp $*