#!/bin/bash

#    Created by vendforce for the Matthew Woelk	in the arch AUR
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

#### Check for the latest availible version, and get the current changlog version
VERSION=$(wget $WGET_HSTS -qO - /dev/null "http://www.tenable.com/products/nessus/new-in-nessus"  | grep -o "New in Nessus [0-9.0-9.0-9]*"  | grep -o "[0-9.0-9.0-9]*" | head -1 | sed s/[.]/-/g)
RELEASE=$(wget $WGET_HSTS -qO - /dev/null  http://www.tenable.com/products/nessus/new-in-nessus/$VERSION | grep -o "Changelog - [0-9.0-9.0-9]*" | head -1 | awk '{print $NF}')

for FEDORA in {0..9}
	do
ID=$(wget $WGET_HSTS -qO - /dev/null  "https://downloads.nessus.org/nessus3dl.php?file=Nessus-$RELEASE-fc2$FEDORA.x86_64.rpm&licence_accept=yes" | grep "og:description" | cut -d= -f3  | sed -e 's/^"*//' | cut -d* -f1)
	DOWNLOAD=$(wget $WGET_HSTS -O/dev/null -q "http://downloads.nessus.org/nessus3dl.php?file=Nessus-$RELEASE-fc2$FEDORA.x86_64.rpm&licence_accept=yes&t=$ID" && echo "exists" || echo "not exist")
if [[ $DOWNLOAD == exists ]] ;then
	wget $WGET_HSTS -q "http://downloads.nessus.org/nessus3dl.php?file=Nessus-$RELEASE-fc2$FEDORA.x86_64.rpm&licence_accept=yes&t=$ID" -O Nessus-$RELEASE-fc2$FEDORA.x86_64.rpm
	break
else
	echo "Doesn't Exist" > /dev/null
	break
fi
done
