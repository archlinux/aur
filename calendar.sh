#!/bin/bash
set -e
INSTALL_PATH=/opt/calendar
export LD_LIBRARY_PATH="${INSTALL_PATH}/bin:${INSTALL_PATH}/lib:${INSTALL_PATH}/lib/x86_64-linux-gnu:${LD_LIBRARY_PATH}"
exec "${INSTALL_PATH}/bin/CalendarApp" $*