#!/bin/bash

if ! diff -r /opt/openbci-gui/ ~/.local/opt/openbci-gui/ &> /dev/null; then
  echo "Update detected. Copying files to local directory..."
  mkdir -p ~/.local/opt
  cp -r /opt/openbci-gui ~/.local/opt/openbci-gui
fi

exec ~/.local/opt/openbci-gui/OpenBCI_GUI &
