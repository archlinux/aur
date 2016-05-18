#!/bin/sh
exec "$JAVA_HOME/bin/java" -Dsecurity.provider.11=org.bouncycastle.jce.provider.BouncyCastleProvider -jar /usr/share/java/bitsquare/shaded.jar "$@"
