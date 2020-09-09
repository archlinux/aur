#!/bin/bash
# Print skins provided by both DDNet Skin Database and AUR ddnet package
# Copyright (C) 2020 Rafael Fontenelle <rafaelff@gnome.org>
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

# Get list of skins provided by the DDNet Skin Database
makepkg -Cod > /dev/null 2>&1
cd src/ddnet-skins-*/ || exit 1
i=0; skin=
ls -1 > tmp
while read -r skin; do
  db_skin[$i]="$skin"
  ((i++))
done < tmp
rm tmp

# Get list of skins provided by the AUR DDNet package from installed package,
# and fallbacks to a custom repository (if any)
if pacman -Q ddnet > /dev/null; then
  opts='-Ql'
elif pacman -F ddnet > /dev/null; then
  opts='-Fl'
else
  echo "A ddnet package was not found locally neither in a custom repository."
  exit 1
fi
pkg_skin="$(pacman $opts ddnet \
            | grep '/skins/[0-9a-zA-Z]' \
            | sed 's|.*/skins/||' \
            | tr '\n' ' ' \
            2> /dev/null)"

# Compare database and ddnet package for same skins, and store positive
# results in rm_list to be printed in the end.
i=0; j=0
while [ -n "${db_skin[$i]}" ]; do
  if [[ " $pkg_skin " == *" ${db_skin[$i]} "* ]]; then
    rm_list[$j]="'${db_skin[$i]}'"
    ((j++))
  fi
  ((i++))
done

# debug
#echo -e "DDNet Skin Database: \n ${db_skin[@]}\n\n"
#echo -e "AUR 'ddnet' package skins: \n $pkg_skin\n\n"

# Print conflicting skin list to be used in the ddnet-skins's PKGBUILD
echo -e "List of skins to remove in 'ddnet-skins' package:\n\n${rm_list[*]}\n"

