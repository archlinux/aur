#!/bin/sh
exec /usr/bin/java -Xms400M -Xmx2048M -XX:-UseCompressedOops -XX:-UseCompressedClassPointers --enable-preview --enable-native-access ALL-UNNAMED -jar '/usr/share/java/cooja/cooja.jar' "$@"
