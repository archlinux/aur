#!/bin/bash
pushd /usr/share/java/screenstudio> /dev/null \
  && java -cp './*:/usr/share/java/beansbinding.jar' screenstudio.gui.ScreenStudio "$@" \
  && popd > /dev/null
