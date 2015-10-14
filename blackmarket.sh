#!/usr/bin/env bash

# check that the environment is 1.8 or higher
JAVA_VERSION=$(java -version 2>&1 |awk -F '"' '/version/ {print $2}')
if [[ "$JAVA_VERSION" < "1.8" ]]; then
    echo "Java version 1.8 or higher is required, currently java is version $JAVA_VERSION"
    exit 1
fi

java -jar "/usr/share/java/blackmarket/blackmarket.jar"
