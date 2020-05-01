#!/bin/sh
hbmamelib=/usr/lib/hbmame/

mame_first_run() {
  echo "Creating an ini file for HBMAME at $HOME/.hbmame/hbmame.ini"
  echo "Modify this file for permanent changes to your MAME"
  echo "options and paths before running MAME again."

  cd -- ~/.hbmame || exit

  if [ -e hbmame.ini ]; then
    mv hbmame.ini hbmameini.bak || exit
    echo "Your old ini file has been renamed to hbmameini.bak"
  fi

  # Note: the single quotes here are not a mistake; MAME will save these
  # strings verbatim into its configuration file, and expand the variables when
  # it is run in future.
  "$hbmame" \
    -artpath '$HOME/.hbmame/artwork;artwork' \
    -ctrlrpath '$HOME/.hbmame/ctrlr;ctrlr' \
    -inipath '$HOME/.hbmame/ini' \
    -rompath '$HOME/.hbmame/roms' \
    -samplepath '$HOME/.hbmame/samples' \
    -cfg_directory '$HOME/.hbmame/cfg' \
    -comment_directory '$HOME/.hbmame/comments' \
    -diff_directory '$HOME/.hbmame/diff' \
    -input_directory '$HOME/.hbmame/inp' \
    -nvram_directory '$HOME/.hbmame/nvram' \
    -snapshot_directory '$HOME/.hbmame/snap' \
    -state_directory '$HOME/.hbmame/sta' \
    -video opengl \
    -createconfig
}

if [ "$1" = "--newini" ]; then
  mame_first_run
  exit
elif ! [ -e ~/.hbmame ]; then
  echo "Running MAME for the first time..."

  mkdir -- ~/.hbmame
  (
    cd -- ~/.hbmame || exit
    mkdir artwork cfg comments ctrlr diff ini inp nvram samples snap sta roms

    mame_first_run
  ) || exit
fi

cd "$hbmamelib"
exec ./hbmame "$@"
