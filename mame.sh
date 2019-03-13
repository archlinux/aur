#!/bin/sh
mamelib=/usr/lib/mame/

mame_first_run() {
  echo "Creating an ini file for MAME at ~/.mame/mame.ini"
  echo "Modify this file for permanent changes to your MAME"
  echo "options and paths before running MAME again."

  cd -- ~/.mame || exit

  if [ -e mame.ini ]; then
    mv mame.ini mameini.bak || exit
    echo "Your old ini file has been renamed to mameini.bak"
  fi

  # Note: the single quotes here are not a mistake; MAME will save these
  # strings verbatim into its configuration file, and expand the variables when
  # it is run in future.

  mame \
    -rompath '$HOME/.mame/roms;roms' \
    -hashpath '$HOME/.mame/hash;hash' \
    -samplepath '$HOME/.mame/samples' \
    -artpath '$HOME/.mame/artwork;artwork' \
    -ctrlrpath '$HOME/.mame/ctrlr;ctrlr' \
    -inipath '$HOME/.mame/ini' \
    -fontpath '$HOME/.mame/fonts;fonts' \
    -cheatpath '$HOME/.mame/cheat' \
    -crosshairpath '$HOME/.mame/crosshair' \
    -pluginspath '$HOME/.mame/plugins;plugins' \
    -languagepath '$HOME/.mame/language;language' \
    -swpath '$HOME/.mame/software;software' \
    -cfg_directory '$HOME/.mame/cfg' \
    -nvram_directory '$HOME/.mame/nvram' \
    -input_directory '$HOME/.mame/inp' \
    -state_directory '$HOME/.mame/sta' \
    -snapshot_directory '$HOME/.mame/snap' \
    -diff_directory '$HOME/.mame/diff' \
    -comment_directory '$HOME/.mame/comments' \
    -video opengl \
    -noreadconfig -showconfig > mame.ini
}

if [ "$1" = "--newini" ]; then
  echo "Running MAME for the first time..."
  if ! [ -e ~/.mame ]; then
    mkdir -- ~/.mame
  fi
  (
    cd -- ~/.mame || exit
    mkdir -p roms hash samples artwork ctrlr ini fonts cheat crosshair plugins language software
    mame_first_run
  ) || exit
fi

cd "${mamelib}"
exec ./mame "${@/--newini/}"
