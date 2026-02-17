#!/bin/bash
ARGS_FOR_JAVA=()
while [[ $# -gt 0 ]]; do
	if [[ "$1" == -* ]]; then
		ARGS_FOR_JAVA+=("$1")
		shift
	else
		break
	fi
done
exec java -Dstructurizr.dataDirectory="$PWD" -Dstructurizr.themes=/usr/share/structurizr/themes --enable-native-access=ALL-UNNAMED "${ARGS_FOR_JAVA[@]}" -jar /usr/share/java/structurizr/structurizr-1.0.0.war "$@"
