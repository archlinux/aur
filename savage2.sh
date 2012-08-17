#!/bin/sh
dir=$0
name=`basename $dir`
if [ "$name" = "$dir" ]; then
       OIFS=$IFS
       IFS=:
       for path in $PATH; do
               if [ -x "$path/$name" ]; then break; fi
       done
       IFS=$OIFS
       dir=$path/$name
fi
while [ -L "$dir" ]; do
       dir=`readlink "$dir"`
done
cd "`dirname "$dir"`"
./savage2.bin "$*"
