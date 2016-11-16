#!/bin/sh

pkgname=dosbox-kyrandia-book1-fr

usage="$(basename "$0") [-h] -- program to run the kyrandia game with dosbox, french version.

where:
    -h  show this help text

Note : All the files of the game are put in the ~/.${pkgname} directory."


# Copy every file in home, otherwise cannot save
mkdir -p ~/.${pkgname}/
shopt -s extglob
# Copy everything except the current file
# Do not overwrite the existing files
cp -n /opt/${pkgname}/!(*.sh) ~/.${pkgname}/

# Run the game 
dosbox ~/.${pkgname}/KYRANDIA.BAT
