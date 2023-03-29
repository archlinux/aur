#!/bin/sh
if [ ! -d $HOME/.config/OrcaSlicer ]; then
  mkdir -p $HOME/.config/OrcaSlicer
fi
$0-bin
