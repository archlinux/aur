#!/bin/bash
STATIC=main
LINK=
VOLATILE=/dev/shm/$USER/firefox

usage()
{
  echo "Usage: firefox-sync [-dh] [-p profile-basename]"
}

longhelp()
{
  usage
  cat <<EOF

This program syncs your firefox profile to a ramdisk (/dev/shm) and back.

-h prints this help message
-d prints the default profile directory
-p [dir] set the profile basename
-r restores on-disk profile (use only before uninstalling firefox-sync)
EOF
exit 0
}

while getopts dhp:r: options
do
case $options in
  d) echo "default profile directory is ~/.mozilla/firefox/$LINK"
     exit 0;;
  h) longhelp;;
  p) LINK="$OPTARG";;
  r) mv "$VOLATILE" "~/.mozilla/firefox/$LINK-copy"
     mv ~/.mozilla/firefox/"$LINK"{,-trash}
     mv ~/.mozilla/firefox/"$STATIC"{,-trash}
     mv ~/.mozilla/firefox/"$LINK"{-copy,}
     rm -rf ~/.mozilla/firefox/{"$LINK","$STATIC"}-trash;;
  ?) usage
     exit 0;;
  esac
done

if [ -z "$LINK" ]; then
  echo "Profile directory not set. Try the -p option" > /dev/stderr
  exit 1
fi

[[ -r $VOLATILE ]] || install -dm700 $VOLATILE

cd ~/.mozilla/firefox

if [ ! -e "$LINK" ]; then
  echo "~/.mozilla/firefox/$LINK does not exist" > /dev/stderr
  exit 1
fi

if [[ `readlink $LINK` != $VOLATILE ]]; then
  mv $LINK $STATIC
  ln -s $VOLATILE $LINK
fi

if [[ -e $LINK/.unpacked ]]; then
  rsync -av --delete --exclude .unpacked ./$LINK/ ./$STATIC/
else
  rsync -av ./$STATIC/ ./$LINK/
  touch $LINK/.unpacked
fi
