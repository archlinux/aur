#!/bin/sh

mkdir -p $HOME/.modloader64-gui
cd $HOME/.modloader64-gui
cp /opt/modloader64-gui/sfml_audio.node $HOME/.modloader64-gui/ModLoader/emulator/
exec /opt/modloader64-gui/modloader64-gui "$@"
