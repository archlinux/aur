#!/bin/bash

#    Created by vendforce for the Matthew Woelk in the arch AUR
#    Nessusdownlader is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    Nessusdownlader is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

#### Wget https settings
WGET_HSTS="--no-hsts"

RELEASE=6.8.0

echo -e "Downloading Nessus $RELEASE from downloads.nessus.org ... "

if [ -f Nessus-$RELEASE-fc20.x86_64.rpm ] ; then
    echo -e "Local file already exists for Nessus $RELEASE. No need to re-download it."
    exit
fi

# These two lines disabled for now (hard-coded instead) because getting the ID this way is no longer working
#ID=$(wget $WGET_HSTS -qO - /dev/null  "https://downloads.nessus.org/nessus3dl.php?file=Nessus-$RELEASE-fc20.x86_64.rpm&licence_accept=yes" | grep "og:description" | cut -d= -f3  | sed -e 's/^"*//' | cut -d* -f1)
#DOWNLOAD=$(wget $WGET_HSTS -O/dev/null -q "http://downloads.nessus.org/nessus3dl.php?file=Nessus-$RELEASE-fc20.x86_64.rpm&licence_accept=yes&t=$ID" && echo "exists" || echo "not exist")
DOWNLOAD=$(wget $WGET_HSTS -O/dev/null -q "http://downloads.nessus.org/nessus3dl.php?file=Nessus-$RELEASE-fc20.x86_64.rpm&licence_accept=yes&t=39834650794bd3c9ec30dbb14d625b23" && echo "exists" || echo "not exist")

echo "http://downloads.nessus.org/nessus3dl.php?file=Nessus-$RELEASE-fc20.x86_64.rpm&licence_accept=yes&t=$ID"
if [[ $DOWNLOAD == exists ]] ;then
    wget $WGET_HSTS -q "http://downloads.nessus.org/nessus3dl.php?file=Nessus-$RELEASE-fc20.x86_64.rpm&licence_accept=yes&t=$ID" -O Nessus-$RELEASE-fc20.x86_64.rpm
else
    echo "... Downloading the file did not work properly. Get it manually from http://www.tenable.com/products/nessus/select-your-operating-system#tos"
    exit 1
fi

echo -e "... Download script has finished."
