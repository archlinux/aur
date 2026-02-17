#!/bin/bash
exec java -Dstructurizr.dataDirectory="$PWD" -Dstructurizr.themes=/usr/share/structurizr/themes --enable-native-access=ALL-UNNAMED -jar /usr/share/java/structurizr/structurizr-1.0.0.war "$@"
