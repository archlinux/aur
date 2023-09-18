#!/bin/bash
set -e
INSTALL_PATH=/opt/lunarcalendar
echo "INSTALL_PATH:$INSTALL_PATH"
export LD_LIBRARY_PATH=$INSTALL_PATH/bin:$INSTALL_PATH/lib:$INSTALL_PATH/lib/`uname -m`-linux-gnu:$LD_LIBRARY_PATH
echo "LD_LIBRARY_PATH:$LD_LIBRARY_PATH"
$INSTALL_PATH/bin/LunarCalendarApp $*
