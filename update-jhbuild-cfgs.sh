#!/bin/bash
# update-jhbuild-cfgs - update default.jhbuildrc and modulesets files
#
# Copyright (C) 2012-2016 Rafael Fontenelle <rafaelff@gnome.org>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>
#
#
#
# Use this script to make sure your default.jhbuildrc (default JHBuild
# settings) and modulesets are up-to-date, which is important to achieve
# a proper GNOME environment.
#
# jhbuild-src/ = Directory containing a clone of the JHBuild's git repository.
#                  The idea is to not remove this folder, and keep updating in
#                  order to get newest modulesets and default.jhbuildrc
# modulesets/  = Symlink to jhbuild-src/modulesets, and provides all the
#                  moduleset files used by JHBuild
# defaults.jhbuildrc = default configuration file of JHBuild

if [ $EUID -ne 0 ]; then
   echo "This script must be run as root" 2>&1
   exit 1
fi

datadir=/usr/share/jhbuild

echo "`basename $0`: Getting latest JHBuild source code, please wait..."
if [ ! -d $datadir/jhbuild-src ]; then
    git clone https://git.gnome.org/browse/jhbuild $datadir/jhbuild-src
    status=$?
else
    cd $datadir/jhbuild-src
    git pull --rebase
    status=$?
    cd "$OLDPWD"
fi

if [ $? -ne 0 ]; then
    echo "Failed to get JHBuild sources" 2>&1
    exit 1
fi

echo "`basename $0`: Installing newest modulesets..."
cp -dr $datadir/jhbuild-src/modulesets/* $datadir/modulesets

echo "`basename $0`: Installing newest defaults.jhbuildrc..."
cp $datadir/jhbuild-src/jhbuild/defaults.jhbuildrc /usr/lib/python2.7/site-packages/jhbuild/defaults.jhbuildrc

