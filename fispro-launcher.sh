#!/usr/bin/env bash

if [[ -x /usr/lib/jvm/java-8-openjdk/bin/java ]]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
elif [[ -x /usr/lib/jvm/java-8-openjdk/jre/bin/java ]]; then
  export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/jre
fi

exec /usr/lib/fispro/fispro.sh "$@"
