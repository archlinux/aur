#!/bin/sh

# Move to the directory containing this script
BASEDIR=`dirname "$0"`

export LANG=en_US.UTF-8
JAVA_OPTS="$JAVA_OPTS -Dfile.encoding=UTF-8 -Djava.protocol.handler.pkgs=jcifs"

# The directory containing the indexes (must be exported)
export OPENSEARCHSERVER_DATA="$STATE_DIRECTORY"

# Starting the server
java $JAVA_OPTS -jar "${BASEDIR}/opensearchserver.jar" \
  -extractDirectory "${RUNTIME_DIRECTORY}" \
  -httpPort "${SERVER_PORT}" \
  -uriEncoding UTF-8 &

# Writing the PID
echo $! > "$RUNTIME_DIRECTORY/oss.pid"
