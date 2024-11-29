#!/bin/bash

# Set JAVA_HOME to Java 17 explicitly
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export PATH=$JAVA_HOME/bin:$PATH

cd /opt/osm2world

# retrieve VM parameters

vmparams="-Xmx2G --add-exports java.base/java.lang=ALL-UNNAMED --add-exports java.desktop/sun.awt=ALL-UNNAMED --add-exports java.desktop/sun.java2d=ALL-UNNAMED"

if [[ $1 == --vm-params=* ]]; then
  vmparams=${1:12}
  shift
fi

# run OSM2World

java $vmparams -jar OSM2World.jar $@
