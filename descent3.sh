#!/usr/bin/env bash

# Set Bash "strict" mode
# see: http://redsymbol.net/articles/unofficial-bash-strict-mode/
# Do not override IFS here since we use it to accumulate keys!
set -euo pipefail

LIBDIR=/usr/lib/descent3
TARGETDIR=${XDG_DATA_HOME:-$HOME/.local/share}/descent3

function checkCmd() {
  if [ -x "$(command -v $1)" ] ; then
    return 0
  else
    return 1
  fi
}

function runXterm(){
  xterm -e "echo $1 ; echo 'Press Enter to terminate' ; read"
}

if [[ $- == *i* ]] ; then
    MSG="echo"
else
  if checkCmd kdialog ; then
    MSG="kdialog --sorry"
  elif checkCmd zenity ; then
    MSG="zenity --info --text"
  elif checkCmd xmessage ; then
    MSG="xmessage"
  elif checkCmd gxmessage ; then
    MSG="gxmessage"
  else
    MSG=runXterm
  fi
fi

if [ ! -r "$TARGETDIR" ] ; then
    mkdir -p "$TARGETDIR"
fi

if [ ! -d "$TARGETDIR" ] ; then
    $MSG "$TARGETDIR is not a directory, exiting." 
    exit 1
fi

# no need to check the presence of d3-linux.hog this one because we create a symlink anyway

# Assuming we have all this, link the current files
cd "$TARGETDIR"
ln -sf /usr/lib/descent3/Descent3 .
ln -sf /usr/lib/descent3/d3-linux.hog .
ln -sf /usr/lib/descent3/online .
ln -sf /usr/lib/descent3/netgames .
./Descent3

