#!/bin/sh
NAME=`basename $0`
VER=`pacman -Q $NAME | sed "s:$NAME ::g"`

mkdir -p ~/.$NAME
cd ~/.$NAME

#export RPG2K3_RTP_PATH=/opt/rpg2003-rtp

[ "z"`cat ~/.$NAME/game.ver` = "z"$VER ] && exec easyrpg-player --encoding shift-jis || find -type l | while read line
    do rm $line;done
echo $VER > ~/.$NAME/game.ver

cd /opt/$NAME
find . -type d | while read line;do mkdir -p ~/.$NAME/$line;done
find . -type f | while read line
do
    [ -f ~/."$NAME/$line" ] || ln -s "/opt/$NAME/$line" ~/."$NAME/$line"
done

cd ~/.$NAME
exec easyrpg-player --encoding shift-jis
