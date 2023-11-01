#!/usr/bin/bash

export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"
java -jar /usr/lib/freerouting/freerouting-executable.jar "$@"

exit 0
