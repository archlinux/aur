#!/bin/bash

CLIENTARGS=""
uname -m | grep i686 && CLIENTARGS="-client -Xmx256m"

SCDIR=/usr/lib/jitsi
LIBPATH="$SCDIR/lib"
CLASSPATH="$LIBPATH/jdic_stub.jar:$LIBPATH/jdic-all.jar:$LIBPATH/felix.jar:$LIBPATH/bcprovider.jar:$SCDIR/sc-bundles/sc-launcher.jar:$SCDIR/sc-bundles/util.jar"
FELIX_CONFIG="$LIBPATH/felix.client.run.properties"
LOG_CONFIG="$LIBPATH/logging.properties"
COMMAND=("$JAVA_HOME/bin/java" $CLIENTARGS -classpath "$CLASSPATH" -Djna.library.path="$LIBPATH/native" -Dfelix.config.properties="file:$FELIX_CONFIG" -Djava.util.logging.config.file="$LOG_CONFIG" net.java.sip.communicator.launcher.SIPCommunicator)

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$LIBPATH/native"

cd "$SCDIR"

exec "${COMMAND[@]}" "$@"
