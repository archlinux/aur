#!/bin/sh

[ -x /etc/profile.d/openjdk6.sh ] && . /etc/profile.d/openjdk6.sh
[ -x /etc/profile.d/jdk.sh ] && . /etc/profile.d/jdk.sh
[ -x /etc/profile.d/jre.sh ] && . /etc/profile.d/jre.sh

PROPFILE='/etc/conf.d/air-video-server'
LOCALPROP=`echo ~/.air-video-server/air-video-server.properties`

([ "$1" = "verbose" ] || [ "$2" = "verbose" ]) && VERBOSE="1"
if [ -a "$1" ]; then
  PROPFILE="$1"
else 
  if [ -a "$2" ]; then
    PROPFILE="$2"
  else
    [ -a $LOCALPROP ] && PROPFILE=$LOCALPROP
  fi
fi

EXECLINE="$JAVA_HOME/bin/java -Djava.awt.headless=true -jar /usr/share/air-video-server/AirVideoServerLinux.jar "$PROPFILE""
if [ -n "$VERBOSE" ]; then
  exec $EXECLINE
else
  exec $EXECLINE > /dev/null 2> /dev/null
fi

