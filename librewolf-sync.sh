#!/bin/bash
STATIC=main
LINK=
VOLATILE=/dev/shm/$USER/librewolf

usage()
{
  echo "Usage: librewolf-sync [-dh] [-p profile-basename]"
}

longhelp()
{
  usage
  cat <<EOF

This program syncs your librewolf profile to a ramdisk (/dev/shm) and back.

-h prints this help message
-d prints the default profile directory
-p [dir] set the profile basename
-r restores on-disk profile (use only before uninstalling librewolf-sync)
EOF
exit 0
}

while getopts dhp:r: options
do
case $options in
  d) echo "default profile directory is ~/.librewolf/$LINK"
     exit 0;;
  h) longhelp;;
  p) LINK="$OPTARG";;
  r) mv "$VOLATILE" "~/.librewolf/$LINK-copy"
     mv ~/.librewolf/"$LINK"{,-trash}
     mv ~/.librewolf/"$STATIC"{,-trash}
     mv ~/.librewolf/"$LINK"{-copy,}
     rm -rf ~/.librewolf/{"$LINK","$STATIC"}-trash;;
  ?) usage
     exit 0;;
  esac
done

if [ -z "$LINK" ]; then
  echo "Profile directory not set. Try the -p option" > /dev/stderr
  exit 1
fi

[[ -r $VOLATILE ]] || install -dm700 $VOLATILE

cd ~/.librewolf

if [ ! -e "$LINK" ]; then
  echo "~/.librewolf/$LINK does not exist" > /dev/stderr
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
