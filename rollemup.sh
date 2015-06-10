#!/bin/sh

# OSS emulator ('padsp' for Pulseaudio, 'aoss' for ALSA, leave empty for OSS)
OSSEMU=""

# directory where the game is installed
INSTALLDIR="/opt/rollemup"

# create copies and links to data files in home directory
# (this allows per user highscores and settings)
if [ ! -e ~/.rollemup/Media/Rollemup.8.MSF ]; then
  # need to be user writeable
  mkdir -p ~/.rollemup/{Games,Upload}
  cp $INSTALLDIR/Upload/Highscore.html ~/.rollemup/Upload
  # static data
  ln -s -t ~/.rollemup $INSTALLDIR/Media
  ln -s -t ~/.rollemup/Upload $INSTALLDIR/Upload/{send.gif,name.jpg,hiscore.jpg}
fi

# change path to our built environment, set path to ancient library and launch the game
cd ~/.rollemup && LD_LIBRARY_PATH=$INSTALLDIR/lib exec $OSSEMU $INSTALLDIR/Rollemup $*
