#!/bin/sh
#
# CatacombSDL launcher // carstene1ns 2014
#
# Does some juggling with the path to help finding the data files

[ ! -d $HOME/.catacombsdl ] && mkdir -p $HOME/.catacombsdl

if [ -f $HOME/.catacombsdl/LEVEL1.CA2 ]; then

  cd $HOME/.catacombsdl && exec /usr/share/catacombsdl/catacomb "$@"

else

  echo "Please place 'The Catacomb' / 'Catacomb II' data files in \"~/.catacombsdl\"."

fi
