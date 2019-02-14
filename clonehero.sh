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


# I am the second maintainer of this package, and I concur;
# this hack is horrible. I do offer my thanks though to the original
# maintainer; debugging this must have been a pain in the ass.
#
# The Clone Hero devs are probably going
# to focus on project Note Hitter instead of this game, so I don't
# expect new releases to be coming soon, meaning that this issue will
# not be fixed, at least not in the near future.

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

if [[ "/opt/$pkgname/clonehero" -nt "$HOME/.$pkgname/clonehero" ]]; then
    echo "Replacing old executable"
    # This was the name of the executable before v0.21.7
    rm "$HOME/.$pkgname/Clone Hero.x86_64"
    cp "/opt/$pkgname/clonehero" "$HOME/.$pkgname/clonehero"
fi


cd "$HOME/.$pkgname"
exec "./clonehero" "$@"
