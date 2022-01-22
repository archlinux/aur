#!/bin/bash
#
# Run VStar

# 32 or 64 bit?
VER=`uname -a | grep _64`

if [ "$VER" != "" ]; then
    # 64 bit, so determine half of available memory for Mac OS X or Linux
    if [ "`echo $OSTYPE | grep linux`" != "" ]; then
        # assume Linux...
        HALF_MEM=$(perl -e "print int(`cat /proc/meminfo | head | awk '/MemTotal:/{print $2}'` / 1024/1024/2);")
    fi

    if [ "$HALF_MEM" == "" ]; then
        # ...for any other case (e.g. a Unix with no /proc
        # or non-Unix bash), set to a conservative value of 4GB
        HALF_MEM="4"
    fi

    if [ "$HALF_MEM" == "0" ]; then
      # <2g
      MAX_MEM=1000m
    else
      MAX_MEM=${HALF_MEM}g
    fi
else
    MAX_MEM=1500m
fi

java -splash:"/usr/share/pixmaps/vstaricon.png" \
     -Xms800m -Xmx${MAX_MEM} -jar "/usr/share/vstar/dist/vstar.jar" $*
