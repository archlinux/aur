#!/bin/bash
pushd /usr/share/webcamstudio > /dev/null \
  && java -jar WebcamStudio.jar "$@" \
  && popd > /dev/null
