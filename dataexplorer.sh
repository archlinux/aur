#!/usr/bin/env sh

# Check if we have openjdk17 installed
if [ -d /usr/lib/jvm/java-17-openjdk ]; then
  export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
  export PATH="${JAVA_HOME}/bin/:$PATH"
  cd /opt/DataExplorer
  ./DataExplorer "$@"
else
  echo "You do not seem to have java-runtime-openjdk=17 installed."
  exit 1
fi
