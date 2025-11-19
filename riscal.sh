#!/bin/sh
BASE_DIR=/usr/share/riscal
LIB="${BASE_DIR}/lib"

# Use JAVA env var if set
JAVA_BIN="${JAVA:-java}"

# Detect Java major version
JAVA_MAJOR="$("$JAVA_BIN" -version 2>&1 | awk 'NR==1 {
  gsub(/"/,"",$2);
  split($2,a,".");
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

# Run RISCAL
exec "$JAVA_BIN" \
  $JAVA_FLAGS \
  -cp "${LIB}/*:${LIB}/swt64/*" \
  -Xmx2G -Xms1G -Xss64M \
  -splash:"${LIB}/Screenshot.png" \
  riscal.Main "$@"
