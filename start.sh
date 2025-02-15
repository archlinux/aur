#!/bin/bash

JAVA=$(command -v java)
JAR_FILE="/usr/share/java/vdr-channeleditor/vdr-channeleditor.jar"    # Name deiner JAR-Datei

if [ -z "$JAVA" ]; then
  printf "ERROR: JAVA is not available.\n"
  exit 1
fi

if [ ! -f "$JAR_FILE" ]; then
	printf 'ERROR: %s not found.\n' "$JAR_FILE"
	exit 1
fi

# Optional parameters
if [ $# -gt 0 ]; then
	declare -a JAVA_OPTS

	while [ $# -gt 0 ]; do
		case "$1" in
			-D*)
				JAVA_OPTS+=("$1")
				shift
				;;
			*)
				break
				;;
		esac
	done
fi

$JAVA "${JAVA_OPTS[@]}" -jar "$JAR_FILE" "$@"
