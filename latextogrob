#!/bin/bash
#
# latextogrob: A simple script that converts a file with LaTeX fomulae into a grob image.
#
# Copyright (c) 2010-2011 Adria ARRUFAT <swiftscythe@gmail.com>
#
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU Library General Public License as published
# by the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

usage () {
	echo "$0 [input file]"
	echo ""
	echo " This is a simple script that converts a file with LaTeX fomulae into a grob image."
	echo " The input file must contain one formula per line and end with an empty line."
	echo ""
	exit 1
}

[ "$1" = "" ]       && usage
[ "$1" = "--help" ] && usage
[ "$1" = "-h" ]     && usage

# Customised mathTeX options for better results in HP 50g display
linetogif()
{
  mathtex -m 0 "\tiny\dpi{140}\gammacorrection{3}\mathtt{$2}" -o $1
}

# Timer start
START="$(date +%s)"

# Parse the input file: 
# change '\' -> '\\'  
# change ' ' -> '\\;' 
# etc
# You can add or remove more rules: 
sed -e "s/\\\/\\\\\\\/g" \
  -e "s/ /\\\\\\\;/g" \
  -e "s/·/\\\\\\\cdot{}/g" \
  -e "s/(/\\\\\\\left(/g" \
  -e "s/)/\\\\\\\right)/g" \
  -e "s/\[/\\\\\\\left\[/g" \
  -e "s/\]/\\\\\\\right\]/g" \
  -e "s/à/\\\\\\\grave{a}/g" \
  -e "s/è/\\\\\\\grave{e}/g" \
  -e "s/ì/\\\\\\\grave{i}/g" \
  -e "s/ò/\\\\\\\grave{o}/g" \
  -e "s/á/\\\\\\\acute{a}/g" \
  -e "s/é/\\\\\\\acute{e}/g" \
  -e "s/í/\\\\\\\acute{i}/g" \
  -e "s/ó/\\\\\\\acute{o}/g" \
  -e "s/ú/\\\\\\\acute{u}/g" \
  $1 > $1.tmp

let "i = 1"
TEN=10
HUNDRED=100
LINES=$(wc -l $1 | awk '{print $1}')
NAME=$(echo $1 | sed -e "s/.tex//g")

# Convert each line of the input file into a gif.
cat $1.tmp | while read line;
do
  if [ $i -lt $TEN ]; then
    linetogif $NAME-00$i $(echo $line)
    convert -border 2 -bordercolor transparent $NAME-00$i.gif $NAME-00$i.gif
  elif [ $i -lt $HUNDRED ]; then
    linetogif $NAME-0$i $(echo $line)
    convert -border 2 -bordercolor transparent $NAME-0$i.gif $NAME-0$i.gif
  else
    linetogif $NAME-$i $(echo $line)
    convert -border 2 -bordercolor transparent $NAME-$i.gif $NAME-$i.gif
  fi
  echo -en "Progress $i/$LINES \r"
  let "i += 1"
done

# Remove the temporary file
rm $1.tmp

# If a previous formula image file exists, remove it
if [ -f $NAME.gif ]; then
  rm $NAME.gif
fi

# Append all gif images beginning with the same name into a larger gif
convert $NAME-*.gif -append $NAME.gif

# Convert the resulting image into grb
giftopnm $NAME.gif | ppmtopgm | pgmtogrob > $NAME.grb

# Timer end
END="$(date +%s)"
ELAPSED="$(expr $END - $START)"

echo -e "\nDone! All $LINES images correctly converted in $ELAPSED seconds!\a\v"
