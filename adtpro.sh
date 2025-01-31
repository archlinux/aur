#!/bin/sh
#
# ADTPro - *nix startup shell script
#
# Note:
#   Invoke with the name of the communications button to push
#   in order to start with that mode active (i.e. './adtpro.sh ethernet')
#
# You can set two variables here:
#   1. $MY_JAVA_HOME - to pick a particular java to run under
#   2. $ADTPRO_HOME - to say where you installed ADTPro
#
# Set default ADTPRO_HOME to be the fully qualified
# current working directory.
export ADTPRO_HOME="/usr/share/java/adtpro"
cd "$ADTPRO_HOME"

# Uncomment and modify one or both of the lines below if you
# want to specify a particular location for Java or ADTPro.
# Note: They must have a trailing backslash as in the examples!
#
# export MY_JAVA_HOME=/usr/local/java/bin/
# export ADTPRO_HOME=~/myuser/adtpro/

OS=`uname`
OS_ARCH=`uname -p`

if [ "$1x" = "headlessx" ]; then
  shift
  if [ "$1x" = "x" ] || [ ! -f /usr/bin/xvfb-run ]; then
    if [ ! -f /usr/bin/xvfb-run ]; then
      echo "Headless operation requires xvfb."
    else
      echo "usage: adtpro.sh [ headless ] [ serial | ethernet | audio | localhost ]"
    fi
    exit 1
  else
    HEADLESS="xvfb-run --auto-servernum "
  fi
fi

$HEADLESS"$MY_JAVA_HOME"java -Xms256m -Xmx512m -cp "$ADTPRO_HOME"/ADTPro-v.r.m.jar:"$ADTPRO_HOME"/AppleCommander-ant-1.8.0-SNAPSHOT.jar:"$ADTPRO_HOME"/jssc-2.9.4.jar:"$ADTPRO_HOME"/slf4j-nop-1.7.36.jar org.adtpro.ADTPro $*
