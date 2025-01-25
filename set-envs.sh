#!/bin/sh

# set the home of the java runtime to the one provided by the package currently installed on the system
# this is necessary because the default java runtime is not necessarily the one we want to use
if [ -z "$INSTALL4J_JAVA_HOME_OVERRIDE" ]; then
  jre_package=$(pacman -Qq java-runtime=11)
  INSTALL4J_JAVA_HOME_OVERRIDE=$(pacman -Qlq "$jre_package" | grep '/bin/java$' | sed 's~/bin/java$~~')
  export INSTALL4J_JAVA_HOME_OVERRIDE
fi

# set the display DPI for Java applications
display_dpi=$(xrdb -query -all | grep "Xft.dpi" | sed -E "s/Xft.dpi:\s+//")
if [ -n "$display_dpi" ]; then
  java2d_ui_scale="-Dsun.java2d.uiScale=${display_dpi}dpi"
  if [ -n "$INSTALL4J_ADD_VM_PARAMS" ]; then
    INSTALL4J_ADD_VM_PARAMS="$INSTALL4J_ADD_VM_PARAMS $java2d_ui_scale"
  else
    INSTALL4J_ADD_VM_PARAMS="$java2d_ui_scale"
  fi
  export INSTALL4J_ADD_VM_PARAMS
fi
