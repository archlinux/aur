#!/bin/bash

##
## This is a simple script to print some info useful for
## updating PGKBUILD file. It's intended for package maintainer's use only.
## For building a package you only need a PKGBUILD.
##

echo "downloading download.html ..."
wget -q https://static.red-lang.org/download.html

_date=$( grep -P '/dl/auto/linux/red-\K([0-9]{2}[a-z]{3}[0-9]{2})' -o download.html )
_commit=$( grep -P '/dl/auto/linux/red-[0-9]{2}[a-z]{3}[0-9]{2}-\K([0-9a-f]*)' -o download.html )
_filename="red-$_date-$_commit"
echo -e "____ filename:\t $_filename"

echo "downloading $_filename ..."
wget -q "https://static.red-lang.org/dl/auto/linux/$_filename"

_sha256=$( grep -Pz '(?s)/dl/auto/linux/red-[0-9]{2}[a-z]{3}[0-9]{2}-.*?\K([0-9a-f]{64})' -o download.html )
_days=$( expr \( `date --date="$_date" "+%s"` - `date --date="07mar11" "+%s"` \) \/ 86400 )
echo -e "____ sha256:\t $_sha256"

printf "____ pkgver:\t r%s.%s" "$_days" "$_date.$_commit"
echo

echo
echo "integrity check:"
echo "$_sha256 ./$_filename" | sha256sum -c -

echo
echo "cleanup:"

echo "./download.html ..."
rm ./download.html

echo "./$_filename ..."
rm "./$_filename"
