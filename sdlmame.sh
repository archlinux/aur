#!/bin/sh

# Create a variable equal to $HOME that will be used later in the ini creation
home=('$HOME')

_run() {
  /usr/share/sdlmame/sdlmame \
    -artpath "$home/.mame/artwork;/usr/share/sdlmame/artwork" \
    -ctrlrpath "$home/.mame/ctrlr;/usr/share/sdlmame/ctrlr" \
    -inipath "$home/.mame/ini;/usr/share/sdlmame/ini" \
    -fontpath "$home/.mame/fonts;/usr/share/sdlmame/fonts" \
    -hashpath "$home/.mame/hash;/usr/share/sdlmame/hash" \
    -pluginspath "$home/.mame/plugins;/usr/share/sdlmame/plugins" \
    -rompath "$home/.mame/roms;/usr/share/sdlmame/roms" \
    -bgfx_path "/usr/share/sdlmame/bgfx" \
    -languagepath "/usr/share/sdlmame/language" \
    -swpath "/usr/share/sdlmame/software" \
    -cfg_directory "$home/.mame/cfg" \
    -cheatpath "$home/.mame/cheat" \
    -comment_directory "$home/.mame/comments" \
    -crosshairpath "$home/.mame/crosshair" \
    -diff_directory "$home/.mame/diff" \
    -input_directory "$home/.mame/input" \
    -nvram_directory "$home/.mame/nvram" \
    -samplepath "$home/.mame/samples"\
    -snapshot_directory "$home/.mame/snapshot" \
    -state_directory "$home/.mame/state" \
    -video opengl \
    -createconfig
}

if [ "$1" != "" ] && [ "$1" = "--newini" ]; then
  echo "Rebuilding the ini file at $HOME/.mame/mame.ini"
  echo "Modify this file for permanent changes to your SDLMAME"
  echo "options and paths before running SDLMAME again."
  cd "$HOME/.mame"
  if [ -e mame.ini ]; then
    echo "Your old ini file has been renamed to mameini.bak"
    mv mame.ini mameini.bak
  fi
  _run
elif [ ! -e $HOME/.mame ]; then
  echo "Running SDLMAME for the first time..."
  echo "Creating an ini file for SDLMAME at $HOME/.mame/mame.ini"
  echo "Modify this file for permanent changes to your SDLMAME"
  echo "options and paths before running SDLMAME again."
  mkdir "$HOME/.mame"
  mkdir "$HOME/.mame"/{artwork,cfg,cheat,comments,crosshair,ctrlr,diff,fonts,hash,ini,input,nvram,plugins,samples,snapshot,state,roms}
  cd "$HOME/.mame"
  _run
else
  cd /usr/share/sdlmame
  ./sdlmame "$@"
fi
