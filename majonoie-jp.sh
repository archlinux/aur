#!/bin/sh

NAME=`basename $0`
VER=`pacman -Q $NAME | sed "s:$NAME ::g"`

mkdir -p ~/.$NAME
cd ~/.$NAME

[ "z"`cat ~/.$NAME/mkxp.ver` = "z"$VER ] && exec mkxp || find -type l | while read line
    do rm $line;done
echo $VER > ~/.$NAME/mkxp.ver
    
[ -f ~/.$NAME/mkxp.conf ] || cp /opt/$NAME/mkxp.conf ~/.$NAME/
cd /opt/$NAME
find . -type d | while read line;do mkdir -p ~/.$NAME/$line;done
find . -type f | while read line
do
    [ -f ~/.$NAME/$line ] || ln -s /opt/$NAME/$line ~/.$NAME/$line
done

cd ~/.$NAME
exec mkxp
