#!/bin/sh

#edit this to increase memory (MB)
JAVAOPTS="-Xmx8000M"

# Setup environment variables
FSEQ_LIB="/usr/share/java/fseq/"
CLASSPATH="$FSEQ_LIB/commons-cli-1.1.jar:$FSEQ_LIB/fseq.jar"
exec /usr/bin/java -cp $CLASSPATH edu.duke.igsp.gkde.Main "$@"