#!/usr/bin/bash

exec java --add-opens=java.desktop/java.awt=ALL-UNNAMED -jar /usr/share/java/frostwire/frostwire.jar "${@}"
