#!/bin/bash
#
# Zelda Classic launcher - (c) carstene1ns 2013
#
# Does some magic juggling with the data files

# Changelog:
#  * 11-2016: Added XDG support

jail_dir=${XDG_CONFIG_HOME:-$HOME/.config}/zelda-classic

# migrate files from old location
jail_old=$HOME/.zelda-classic

if [ ! -e $jail_dir ]; then
  mkdir -p $jail_dir

  if [ -e $jail_old ]; then
    for f in $jail_old/{*.{qst,dat,nsf,txt},samplesoundset,{zelda,zlaunch,zquest}-l}; do
      [ -L $f ] && rm $f
    done

    mv $jail_old/{ag.cfg,allegro.log,zc.{icn,lck,sav}} $jail_dir
  fi

fi

# symlink files from installation directory
for f in /opt/zelda-classic/{*.{qst,dat,nsf,so},samplesoundset,z*-l} \
         /usr/share/doc/zelda-classic/zquest.txt; do
  [ ! -e $jail_dir/${f##*/} ] && ln -s $f $jail_dir
done

# change to directory and launch
cd $jail_dir

case "${0##*/}" in
  zelda-classic)
    exec ./zelda-l "$@"
    ;;
  zelda-classic-zlaunch)
    exec ./zlaunch-l "$@"
    ;;
  zelda-classic-zquest)
    exec ./zquest-l "$@"
    ;;
  *)
    echo "Something is wrong with your Zelda Classic installation."
    ;;
esac

cd - &>/dev/null
