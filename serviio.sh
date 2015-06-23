#!/bin/sh

if [ $UID -eq 0 ]
then
    if [[ -f /etc/profile.d/jdk.sh ]]; then
        . /etc/profile.d/jdk.sh
    elif [[ -f /etc/profile.d/jre.sh ]]; then
        . /etc/profile.d/jre.sh
    fi
    export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
    SERVIIO_HOME="/usr/share/java/serviio"
    SERVIIO_CLASS_PATH="$SERVIIO_HOME/lib/*:$SERVIIO_HOME/config"
    JAVA_OPTS="-Djava.net.preferIPv4Stack=true -Djava.awt.headless=true -Dderby.system.home=$SERVIIO_HOME/library -Dserviio.home=$SERVIIO_HOME -Dffmpeg.location=ffmpeg"

    java -Xmx384M $JAVA_OPTS -classpath $SERVIIO_CLASS_PATH org.serviio.MediaServer "$@"
else
    echo "Must be run as root."
fi
