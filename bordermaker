#!/bin/bash
JAVA_VERSION_ORIGINAL=`archlinux-java get`
#echo "JAVA_VERSION_ORIGINAL = " $JAVA_VERSION_ORIGINAL
#sleep 5
kdesudo --caption 'bordermaker needs java 6 :' archlinux-java set java-6-jre/jre
#sleep 10
#JAVA_VERSION=`archlinux-java get`
#echo "Après commande «archlinux-java set java-6-jre/jre» : JAVA_VERSION = " $JAVA_VERSION
java -Xmx1g -jar /usr/share/java/bordermaker/BorderMaker.jar "$@"
#sleep 3
#JAVA_VERSION=`archlinux-java get`
#echo "Après fermeture de bordermaker : JAVA_VERSION = " $JAVA_VERSION
#sleep 5
kdesudo --caption 'returns to original java version :' archlinux-java set $JAVA_VERSION_ORIGINAL
#sleep 5
#JAVA_VERSION=`archlinux-java get`
#echo "Après commande «archlinux-java set JAVA_VERSION» : JAVA_VERSION = " $JAVA_VERSION
