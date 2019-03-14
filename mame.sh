#!/bin/sh
mamelib=/usr/lib/mame/

mame_first_run() {
  echo "Creating an ini file for MAME at ~/.config/mame/mame.ini"
  echo "Config and shared files is stored into"
  echo " ~/.config/mame and  ~/.local/share/mame"
  echo "Modify this file for permanent changes to your MAME"
  echo "options and paths before running MAME again."

  cd -- ~/.config/mame || exit

  if [ -e mame.ini ]; then
    mv mame.ini mameini.bak || exit
    echo "Your old ini file has been renamed to mameini.bak"
  fi

  # Note: the single quotes here are not a mistake; MAME will save these
  # strings verbatim into its configuration file, and expand the variables when
  # it is run in future.

  mame \
    -rompath '$HOME/.local/share/mame/roms;roms' \
    -hashpath '$HOME/.local/share/mame/hash;hash' \
    -samplepath '$HOME/.local/share/mame/samples' \
    -artpath '$HOME/.local/share/mame/artwork;artwork' \
    -ctrlrpath '$HOME/.local/share/mame/ctrlr;ctrlr' \
    -inipath '$HOME/.config/mame/ini' \
    -fontpath '$HOME/.local/share/mame/fonts;fonts' \
    -cheatpath '$HOME/.local/share/mame/cheat' \
    -crosshairpath '$HOME/.local/share/mame/crosshair' \
    -pluginspath '$HOME/.local/share/mame/plugins;plugins' \
    -languagepath '$HOME/.local/share/mame/language;language' \
    -swpath '$HOME/.local/share/mame/software;software' \
    -cfg_directory '$HOME/.config/mame/cfg' \
    -nvram_directory '$HOME/.local/share/mame/nvram' \
    -input_directory '$HOME/.local/share/mame/inp' \
    -state_directory '$HOME/.local/share/mame/sta' \
    -snapshot_directory '$HOME/.local/share/mame/snap' \
    -diff_directory '$HOME/.local/share/mame/diff' \
    -comment_directory '$HOME/.local/share/mame/comments' \
    -video opengl \
    -noreadconfig -showconfig > mame.ini
}

if [ "$1" = "--newini" ]; then
  echo "Running MAME for the first time..."
  if ! [ -e ~/.config/mame ]; then
    mkdir -- ~/.config/mame
  fi
    if ! [ -e ~/.local/share/mame ]; then
    mkdir -- ~/.local/share/mame
  fi
  
  (
    cd -- ~/.config/mame || exit
    mkdir -p ini
    cd -- ~/.local/share/mame || exit
    mkdir -p roms hash samples artwork ctrlr fonts cheat crosshair plugins language software
    mame_first_run
  ) || exit
fi

cd "${mamelib}"
exec ./mame "${@/--newini/}"
