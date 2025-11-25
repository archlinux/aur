#!/bin/sh
BASE_DIR=/usr/share/riscal
LIB="${BASE_DIR}/lib"

# Use JAVA env var if set
JAVA_BIN="${JAVA:-java}"

# Detect Java major version
JAVA_MAJOR="$("$JAVA_BIN" -version 2>&1 | awk 'NR==1 {
  gsub(/"/,"",$3);
  split($3,a,".");
  if (a[1]=="1") print a[2]; else print a[1];
}')"

JAVA_FLAGS=""
# Enable native access there for JDK 22+
if [ -n "$JAVA_MAJOR" ] && [ "$JAVA_MAJOR" -ge 22 ] 2>/dev/null; then
  JAVA_FLAGS="--enable-native-access=ALL-UNNAMED"
fi

# GUI-related environment
export SWT_GTK3="${SWT_GTK3:-1}"
export GDK_BACKEND="${GDK_BACKEND:-x11}"
export WEBKIT_DISABLE_COMPOSITING_MODE="${WEBKIT_DISABLE_COMPOSITING_MODE:-1}"

# Allow user override
JAVAFX_LIB="${JAVAFX_LIB:-}"

# Auto-detect java-openjfx* installations
if [ -z "$JAVAFX_LIB" ]; then
  for d in /usr/lib/jvm/java-*-openjfx/lib; do
    [ -d "$d" ] && JAVAFX_LIB="$d" && break
  done
fi

CP="${LIB}/*:${LIB}/swt64/*"
EXTRA_ARGS=""

if [ -n "$JAVAFX_LIB" ] && [ -d "$JAVAFX_LIB" ]; then
  CP="${CP}:${JAVAFX_LIB}/*"
  EXTRA_ARGS="-visual"
fi

# Run RISCAL
exec "$JAVA_BIN" \
  $JAVA_FLAGS \
  -cp "$CP" \
  -Xmx2G -Xms1G -Xss64M \
  -splash:"${LIB}/Screenshot.png" \
  riscal.Main $EXTRA_ARGS "$@"
