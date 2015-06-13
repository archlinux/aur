#!/bin/sh

if [ ! -e $HOME/.daphne ]; then
  echo "Running Daphne for the first time..."
  echo "Copy your framefiles/roms/mpegs to the corresponding folders"
  echo "within $HOME/.daphne and reference them from the command-line."
  echo "Ex: daphne lair vldp -framefile '~/.daphne/framefile/lair.txt'"
  mkdir $HOME/.daphne
  mkdir $HOME/.daphne/{roms,mpegs}
  cp -R /usr/share/daphne/roms/* $HOME/.daphne/roms/
  cd /usr/share/daphne
  ./daphne "$@"
else
  export PATH=/usr/share/daphne:$PATH
  cd /usr/share/daphne
  ./daphne "$@"
fi
