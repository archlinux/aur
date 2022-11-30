#!/bin/sh
if [ ! -d $HOME/.config/BambuStudio ]; then
  mkdir -p $HOME/.config/BambuStudio
fi
$0-bin
