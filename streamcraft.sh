#!/bin/sh
# The bootstrap downloads a JavaFX 8 launcher (Launcher.jar). On modern systems
# JavaFX 8 auto-detects GTK3 and crashes (SIGSEGV in GtkNativeMainLoopThread)
# from the GTK2/GTK3 symbol clash; forcing GTK2 fixes it. The bootstrap clears
# _JAVA_OPTIONS for the launcher JVM it spawns but leaves JAVA_TOOL_OPTIONS
# intact, so that is the channel that reaches the launcher.
export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:+$JAVA_TOOL_OPTIONS }-Djdk.gtk.version=2"
exec java -jar /usr/share/streamcraft/streamcraft-bootstrap.jar "$@"
