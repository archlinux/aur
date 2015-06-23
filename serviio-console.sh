#!/bin/sh

    export PATH=/usr/lib/jvm/java-8-openjdk/jre/bin/:$PATH
    SERVIIO_CONSOLE_HOME="/usr/share/java/serviio"
    SERVIIO_CLASS_PATH="$SERVIIO_CONSOLE_HOME/lib/*:$SERVIIO_CONSOLE_HOME/config"
    JAVA_OPTS="-Dserviio.home=$SERVIIO_CONSOLE_HOME -Djava.net.preferIPv4Stack=true"

    java -Xmx512M $JAVA_OPTS -classpath $SERVIIO_CLASS_PATH org.serviio.console.ServiioConsole "$@"
