#!/bin/sh

appname="TrueConf"
base_path="/opt/trueconf"
lib_path="${base_path}/lib"

  if [ "$DESKTOP_SESSION" = "plasma" ]
  then
    DESKTOP_SESSION="kde"
    export DESKTOP_SESSION
  fi

LD_LIBRARY_PATH=${lib_path}:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH
${base_path}/${appname} "$@"
