#!/bin/sh
NAME=vsmodelcreator
MAIN_CLASS=at.vintagestory.modelcreator.Start
cd /usr/share/java/$NAME/
exec /usr/bin/java -cp $NAME'.jar:libs/*' $MAIN_CLASS "$@"
