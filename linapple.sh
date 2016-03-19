#! /bin/bash

progName="linapple"
progRealPath="/usr/share/$progName"
progHome="$HOME/.$progName"

cd $progHome

# Symlink stuff
mkdir -p "$progHome" || exit 1
# Delete broken symlinks
find -L "$progHome" -type l -delete
# Update existing symlinks, add new symlinks
cp -urs "$progRealPath/"* "$progHome" 2> /dev/null

if [ ! -f linapple.conf ]; then
  cp linapple.installed.conf linapple.conf
fi

exec $progRealPath/$progName
