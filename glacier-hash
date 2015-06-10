#!/bin/sh

for FILE in "$@"; do
  "$JAVA_HOME/bin/java" -jar /usr/share/java/glacier-hash/TreeHash.jar ${FILE}
  [ $? -eq 0 ] && echo "  ${FILE}" || echo
done
