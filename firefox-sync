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
EOF
exit 0
}

while getopts dhp: options
do
case $options in
  d) echo "default profile directory is ~/.mozilla/firefox/$LINK"
     exit 0;;
  h) longhelp;;
  p) LINK="$OPTARG";;
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
