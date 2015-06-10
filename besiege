#!/bin/sh
if [[ ! -e /tmp/besiege ]]; then
  if [ ! -h /tmp/besiege ]; then
    if [ -z ${XDG_DATA_HOME} ]; then
      if [ ! -d ${HOME}/.local/share/besiege ]; then
        mkdir -p ${HOME}/.local/share/besiege/{SavedMachines,Screenshots}
      fi
      ln -s ${HOME}/.local/share/besiege /tmp/besiege
    else
      if [ ! -d ${XDG_DATA_HOME}/besiege ]; then
        mkdir -p ${XDG_DATA_HOME}/besiege/{SavedMachines,Screenshots}
      fi
      ln -s ${XDG_DATA_HOME}/besiege /tmp/besiege
    fi
  fi
  /usr/share/besiege/Besiege $@
  rm /tmp/besiege
else
  echo "Game is being run by another user, please terminate that process."
  echo "If you are SURE the game is NOT running, then delete /tmp/besiege"
fi
