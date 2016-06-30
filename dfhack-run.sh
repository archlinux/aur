#!/bin/bash

# check for dwarffortress user directory
if [[ ! -d ~/.dwarffortress ]] ; then
  mkdir -p ~/.dwarffortress/data

  ln -s  /opt/dwarffortress/raw       ~/.dwarffortress/raw
  ln -s  /opt/dwarffortress/libs      ~/.dwarffortress/libs
  cp -rn /opt/dwarffortress/data/init ~/.dwarffortress/data/init

  for link in announcement art dipscript help index initial_movies movies shader.fs shader.vs sound speech ; do
    cp -r /opt/dwarffortress/data/$link ~/.dwarffortress/data/$link
  done
fi

# check for dfhack user directory
if [[ ! -d ~/.dwarffortress/hack ]] ; then
  ln -s /opt/dwarffortress/hack                ~/.dwarffortress/hack
  ln -s /opt/dwarffortress/stonesense          ~/.dwarffortress/stonesense
  ln -s /opt/dwarffortress/dfhack              ~/.dwarffortress/dfhack
  ln -s /opt/dwarffortress/dfhack-run          ~/.dwarffortress/dfhack-run
  ln -s /opt/dwarffortress/dfhack.init-example ~/.dwarffortress/dfhack.init-example
  cp -r /opt/dwarffortress/dfhack-config       ~/.dwarffortress/dfhack-config

  cp ~/.dwarffortress/dfhack.init{-example,}
fi

# workaround for bug in Debian/Ubuntu SDL patch
export SDL_DISABLE_LOCK_KEYS=1

cd ~/.dwarffortress
exec ./dfhack-run "$@"
