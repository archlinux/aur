#!/bin/bash
export LD_LIBRARY_PATH="/usr/share/webcamstudio/lib:$LD_LIBRARY_PATH"
pushd /usr/share/webcamstudio > /dev/null \
  && java -cp 'WebcamStudio.jar:lib/*' webcamstudio.WebcamStudio "$@" \
  && popd > /dev/null
