#!/bin/sh

#+
#  Name:
#     stilts

#  Purpose:
#     Invokes the STILTS application on unix.

#  Description:
#     This shell script invokes the STILTS application.
#     It's not very complicated, but performs some argument manipulation
#     prior to invoking java with the right classpath and classname.
#
#     1. if a class path is specified using either the CLASSPATH
#        environment variable or the -classpath flag to this script,
#        it will be added to the application classpath
#
#     2. any initial command-line arguments which look like they are destined
#        for java itself (starting with -D or -X, or prefixed with -J) will
#        be sent to java, and the others will be sent to the application

#  Requisites:
#     - java should be on the path.
#

#  Authors:
#     MBT: Mark Taylor (Starlink)
#-

#  Pull out any arguments which look to be destined for the java binary.
javaArgs=""
while test "$1"
do
   if echo $1 | grep -- '^-[XD]' >/dev/null; then
      javaArgs="$javaArgs $1"
      shift
   elif echo $1 | grep -- '^-J' >/dev/null; then
      javaArgs="$javaArgs `echo $1 | sed s/^-J//`"
      shift
   elif [ "$1" = "-classpath" -a -n "$2" ]; then
      shift
      export CLASSPATH="$1"
      shift
   else
      break
   fi
done

appjar=/usr/share/java/stilts.jar
CLASSPATH="${appjar}:${CLASSPATH}"

# Execute the command.
java \
   $javaArgs \
   -classpath $CLASSPATH \
   uk.ac.starlink.ttools.Stilts \
   "$@"
