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

case "${0##*/}" in
  zelda-classic)
    ./zelda-l "$@"
  ;;
  zelda-classic-zlaunch)
    ./zlaunch-l "$@"
  ;;
  zelda-classic-zquest)
    ./zquest-l "$@"
  ;;
  *)
    echo "Something is wrong with your Zelda Classic installation."
  ;;
esac

cd - &>/dev/null
