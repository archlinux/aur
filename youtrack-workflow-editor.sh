#!/bin/sh

# Find first instance of Java 6
JAVA_ENV_NAME=$(archlinux-java status | grep -o -m 1 'java-6.*$')
if [ -z "$JAVA_ENV_NAME" ]; then
  # Try Java 5 instead
  JAVA_ENV_NAME=$(archlinux-java status | grep -o -m 1 'java-5.*$')
fi

# If we have a JAVA_ENV_NAME then we will use it, otherwise let YouTrack show error.
if [ -n "$JAVA_ENV_NAME" ]; then
  export PATH=/usr/lib/jvm/$JAVA_ENV_NAME/jre/bin/:$PATH
fi

exec /usr/share/youtrack-workflow-editor/youtrack-workflow.sh $*
