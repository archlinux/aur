#!/bin/bash

pkgname=clonehero

# Here's the issue:
#
# Due to filesystem permission problems, a normal user is unable to play
# Clone Hero when it's just installed into /opt like normal. The game is
# unable to write to that folder, so nothing works properly. The only
# way to get the game to work is to run everything like it exists in the
# user's home folder. Unfortunately, symlinks aren't enough.
#
# We copy over all the needed files from /opt to the user's home
# directory, if we find the copy in /opt to be newer than the one the
# user already has. This way, they get new copies of the executable and
# game data whenever there's a new version. Unfortunately, this does
# mean that we have to touch $HOME, and this is an extremely ugly hack.

if [[ ! -d "$HOME/.$pkgname" ]]; then
    mkdir -p "$HOME/.$pkgname"
fi


# Replace older files on install/reinstall
if [[ "/opt/$pkgname/Songs" -nt "$HOME/.$pkgname/Songs" ]]; then
    echo "Copying songs folder (without overwriting old contents)"
    # We don't want to replace the Songs folder, though
    cp -rn "/opt/$pkgname/Songs" "$HOME/.$pkgname/Songs"
fi

if [[ "/opt/$pkgname/Clone Hero_Data" -nt "$HOME/.$pkgname/Clone Hero_Data" ]]; then
    echo "Replacing old data folder"
    cp -r "/opt/$pkgname/Clone Hero_Data" "$HOME/.$pkgname/Clone Hero_Data"
fi

if [[ "/opt/$pkgname/Clone Hero.x86_64" -nt "$HOME/.$pkgname/Clone Hero.x86_64" ]]; then
    echo "Replacing old executable"
    cp "/opt/$pkgname/Clone Hero.x86_64" "$HOME/.$pkgname/Clone Hero.x86_64"
fi


cd "$HOME/.$pkgname"
exec "./Clone Hero.x86_64" "$@"
