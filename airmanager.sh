#!/bin/bash
export LD_LIBRARY_PATH="/opt/airmanager/lib:$LD_LIBRARY_PATH"
cd /opt/airmanager
exec ./AirManager.sh "$@"
