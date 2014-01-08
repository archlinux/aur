#!/bin/sh
#
# OpenDUNE launcher // carstene1ns 2013
#
# Does some juggling with the data files and path

[ ! -d $HOME/.opendune/data ] && mkdir -p $HOME/.opendune/data

if [ ! -f $HOME/.opendune/data/put_dune2_here.cfg ]; then

  cp /opt/opendune/data/put_dune2_here.txt $HOME/.opendune/data/

fi

if [ -f $HOME/.opendune/data/dune.pak ]; then

  cd $HOME/.opendune
  /opt/opendune/opendune "$@"
  cd - &>/dev/null

else

  echo "Please place Dune II data files in \"~/.opendune/data\"."

fi
