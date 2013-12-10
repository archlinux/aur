#!/bin/sh
#
# Zelda Classic launcher
#
# Does some magic juggling with the data files

mkdir -p $HOME/.zelda-classic

if [ ! -f $HOME/.zelda-classic/1st.qst ]; then

  ln -s /opt/zelda-classic/{*.{qst,dat},zelda.nsf,samplesoundset,{zelda,zlaunch,zquest}-l} $HOME/.zelda-classic/
  ln -s /usr/share/doc/zelda-classic/zquest.txt $HOME/.zelda-classic/

fi

cd $HOME/.zelda-classic
./zelda-l "$@"
cd - &>/dev/null
