#!/usr/bin/env sh

MAP_TOOL_JAVA="${MAP_TOOL_JAVA:-/usr/lib/jvm/java-17-openjdk}"
JAVAFX_PATH="${JAVAFX_PATH:-$MAP_TOOL_JAVA/lib}"

CLASSPATH="/usr/share/java/maptool/*:$JAVAFX_PATH/javafx.base.jar:$JAVAFX_PATH/javafx.controls.jar:$JAVAFX_PATH/javafx.fxml.jar:$JAVAFX_PATH/javafx.graphics.jar:$JAVAFX_PATH/javafx.media.jar:$JAVAFX_PATH/javafx.swing.jar:$JAVAFX_PATH/javafx-swt.jar:$JAVAFX_PATH/javafx.web.jar"
DEFAULT_JVM_OPTS='"-Xss8M" "-Dsun.java2d.d3d=false" "-Dsentry.environment=production" "-Dfile.encoding=UTF-8" "-Dpolyglot.engine.WarnInterpreterOnly=false" "-DMAPTOOL_DATADIR=.maptool-rptools" "-XX:+ShowCodeDetailsInExceptionMessages" "--add-opens=java.desktop/java.awt=ALL-UNNAMED" "--add-opens=java.desktop/java.awt.geom=ALL-UNNAMED" "--add-opens=java.desktop/sun.awt.geom=ALL-UNNAMED" "--add-opens=java.base/java.util=ALL-UNNAMED" "--add-opens=java.desktop/javax.swing=ALL-UNNAMED" "--add-opens=java.desktop/sun.awt.shell=ALL-UNNAMED"'

set -- \
        -classpath "$CLASSPATH" \
        'net.rptools.maptool.client.LaunchInstructions' \
        "$@"

eval "set -- $(
        printf '%s\n' "$DEFAULT_JVM_OPTS $JAVA_OPTS $MAP_TOOL_OPTS" |
        xargs -n1 |
        sed ' s~[^-[:alnum:]+,./:=@_]~\\&~g; ' |
        tr '\n' ' '
    )" '"$@"'

exec "$MAP_TOOL_JAVA/bin/java" "$@"
