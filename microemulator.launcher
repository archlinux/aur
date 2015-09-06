#!/bin/sh
if [ ! -e "$HOME/.microemulator" ]
then
 mkdir "$HOME/.microemulator"
fi
if [ ! -e "$HOME/.microemulator/config2.xml" ]
then
 cp "/usr/share/java/microemulator/config2.xml" "$HOME/.microemulator"
fi
for i in microemu-device-large.jar microemu-device-minimum.jar microemu-device-resizable.jar
do
 if [ ! -e "$HOME/.microemulator/$i" ]
 then
  ln -s "/usr/share/java/microemulator/devices/$i" "$HOME/.microemulator"
 fi
done
exec java -jar /usr/share/java/microemulator/microemulator.jar "$@"
