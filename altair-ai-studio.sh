#!/bin/bash
set -euo pipefail

APPDIR=/opt/altair-ai-studio
export RAPIDMINER_HOME="$APPDIR"

# Candidate JRE 17 locations on Arch
CANDIDATES=(
  "/usr/lib/jvm/java-17-openjdk"
  "/usr/lib/jvm/java-17-openjdk-headless"
)

is_java17() {
  "$1" -version 2>&1 | grep -qE '\bversion "17(\.|")'
}

pick_java17_home() {
  for d in "${CANDIDATES[@]}"; do
    if [ -x "$d/bin/java" ] && is_java17 "$d/bin/java"; then
      echo "$d"; return 0
    fi
  done
  if [ -n "${JAVA_HOME:-}" ] && [ -x "$JAVA_HOME/bin/java" ] && is_java17 "$JAVA_HOME/bin/java"; then
    echo "$JAVA_HOME"; return 0
  fi
  if command -v java >/dev/null 2>&1 && is_java17 "$(command -v java)"; then
    echo ""; return 0   # use PATH java as-is
  fi
  return 1
}

if JH="$(pick_java17_home)"; then
  if [ -n "$JH" ]; then
    export JAVA_HOME="$JH"
    export PATH="$JAVA_HOME/bin:$PATH"
  fi
else
  echo "Java 17 not found. Install 'jre17-openjdk' or set JAVA_HOME to a JDK/JRE 17." >&2
  exit 1
fi

exec "$APPDIR/AI-Studio.sh" "$@"
