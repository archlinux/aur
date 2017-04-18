#!/bin/sh

# automatically extract all .jar for in classpath
JARS=`find -L /usr/share/java/ambienttalk -name '*.jar'`
JARPATH=""
DEFAULT_OBJPATH=""

# append the .jar files using ':' to construct a valid classpath
for JAR in $JARS;
do
	JARPATH="$JARPATH:$JAR"
done

# Set AT_HOME
AT_HOME=/usr/share/ambienttalk

# all top-level directories in the atlib/ subdirectory become available in the lobby
for ROOT in `ls $AT_HOME/atlib`
do
  DEFAULT_OBJPATH="$ROOT=$AT_HOME/atlib/$ROOT:$DEFAULT_OBJPATH"
done

java -DAT_HOME=$AT_HOME -DAT_INIT=$AT_HOME/atlib/at/init/init.at -DAT_OBJECTPATH=$AT_OBJECTPATH -DAT_LIBPATH=$DEFAULT_OBJPATH -classpath .:$CLASSPATH:$JARPATH edu.vub.at.IAT "$@" 2> /dev/null