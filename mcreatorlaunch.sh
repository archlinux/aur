#!/bin/bash
#
# ---------------------------------------
# MCreator Launcher for Unix Like systems
# ---------------------------------------
#

# set the classpath
export CLASSPATH='./lib/mcreator.jar:./lib/*'

# launch MCreator with bundled java
/usr/lib/jvm/java-8-openjdk/bin/java net.mcreator.Launcher "$1"

