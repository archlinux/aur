#!/bin/sh
# Based on:
# https://wiki.archlinux.org/title/Java_package_guidelines

# Force installation in the standard path
CL_INST_CONF="$HOME/.crystalinst"
if [ ! -f $CL_INST_CONF ]
then
    touch "$CL_INST_CONF"
    echo  "$HOME/Crystal-Launcher" > "$CL_INST_CONF"
fi

# At the first time set up the proper JREs in the config file
JAVA_8="%JAVA_8%"
JAVA_16="%JAVA_16%"

CL_CONFIG="`cat $CL_INST_CONF`/config.prop"
if [ ! -f $CL_CONFIG ]
then
    touch $CL_CONFIG
    echo "customjvmdir_v2.path=/usr/lib/jvm/$JAVA_8/jre/bin/java" > "$CL_CONFIG"
    echo "customjvmdir_v2.use=true"                              >> "$CL_CONFIG"
    echo "customjvmdir_v3.path=/usr/lib/jvm/$JAVA_16/bin/java"   >> "$CL_CONFIG"
    echo "customjvmdir_v3.use=true"                              >> "$CL_CONFIG"
fi

# Run the app correctly
exec /usr/bin/java -jar '/usr/share/java/crystal-launcher.jar' "$@"

