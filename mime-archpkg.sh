#!/bin/bash
# author: grimi
# name: mime-archpkg
# require: sed, cat, basename, convert, rsvg-convert, gtk-update-icon-cache

declare MODE=usage
declare MYDIR=/usr/share/mime-archpkg
declare MYTHEME
declare -r NAME=application-x-archpkg


update() {
   local file theme elem suf
   local -i size
   local -a taba tab
   for file in "$MYDIR"/*.svgz; do
      theme="/usr/share/icons/$(basename "$file"|sed 's/\.svgz//')"
      if [[ ${MYTHEME} ]]; then
         if [[ $(basename "$theme") != $MYTHEME ]]; then
            continue
         fi
      fi
      if [[ -f $theme/index.theme ]]; then
         echo ">> Updating mimetype icons in $theme... <<"
         taba=($(cat "$theme/index.theme"|grep "\[.*mimetypes"|sed 's/\[//; s/\]//'))
         for elem in "${taba[@]}"; do
            tab=($(echo $elem|sed 's/\//\n/'))
            if [[ ${tab[0]/[0-9]/} != ${tab[0]} ]]; then
               size=${tab[0]/x[0-9][0-9]*/}
               if [[ ${tab[0]/@2x/} != ${tab[0]} ]]; then
                  size=$size*2
               fi
            elif [[ ${tab[1]/[0-9]/} != ${tab[1]} ]]; then
               size=${tab[1]/x[0-9][0-9]*/}
               if [[ ${tab[1]/@2x/} != ${tab[1]} ]]; then
                  size=$size*2
               fi
            elif [[ ${elem/scalable/} != ${elem} ]]; then
               size=0
            fi
            if [[ $size ]]; then
               if [[ $size -ne 0 ]]; then
                  if [[ -f $theme/$elem/package.svg ]]; then
                     suf=svg
                  else
                     suf=png
                  fi
                  convert -resize ${size}x${size} -background none "$file" /tmp/archpkg.$suf
                  install -m644 /tmp/archpkg.$suf "$theme/$elem/$NAME.$suf"
               else
                  rsvg-convert -o /tmp/archpkg.svg -f svg "$file"
                  install -m644 /tmp/archpkg.svg "$theme/$elem/$NAME.svg"
               fi
            fi
         done
         if [[ -f $theme/icon-theme.cache ]]; then
            gtk-update-icon-cache -q -f "$theme"
         fi
      fi
   done
}

remove() {
   local file theme
   for file in "$MYDIR"/*.svgz; do
      theme="/usr/share/icons/$(basename "$file"|sed 's/\.svgz//')"
      if [[ -d $theme ]]; then
         echo ">> Removing installed mimetype icons from $theme... <<"
         find "$theme/" -type f -name $NAME.png -exec rm "{}" \;
         find "$theme/" -type f -name $NAME.svg -exec rm "{}" \;
         if [[ -f $theme/icon-theme.cache ]]; then
            gtk-update-icon-cache -q -f "$theme"
         fi
      fi
   done
}

usage() {
   echo "USAGE: [-u] [-r] [-s <theme>]"
   echo "     -u: update archpkg mime icons"
   echo "     -r: remove archpkg mime icons"
   echo "     -s: update selected archpkg mime icons theme"
}


case "$1" in
   -u) MODE=update ;;
   -r) MODE=remove ;;
   -s) if [[ $2 ]]; then MODE=update; MYTHEME="$2"; fi ;;
esac

if [[ $MODE != "usage" && $USER != "root" ]]; then
   echo "root privileges needed!"
   exit 1
fi

eval $MODE


