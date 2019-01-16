#!/bin/bash
pushd /usr/share/webcamstudio > /dev/null \
  && java -cp 'WebcamStudio.jar:lib/*' webcamstudio.WebcamStudio "$@" \
  && popd > /dev/null
