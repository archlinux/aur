#!/usr/bin/env sh

LIBRARY_PATH="/usr/lib/jni/"

exec java -Djava.library.path="${LIBRARY_PATH}" -jar /usr/share/java/DICOMscope.jar
