#!/bin/sh
APP_LOCAL_DIR=$HOME/.linrad
APP_DATA_DIR=/usr/share/linrad
APP_EXECUTABLE=/usr/bin/xlinrad
mkdir -p $APP_LOCAL_DIR
cd $APP_LOCAL_DIR && exec $APP_EXECUTABLE "$@"
