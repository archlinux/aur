#!/usr/bin/env sh

MAP_TOOL_JAVA="${MAP_TOOL_JAVA:-/usr/lib/jvm/default-runtime}"
JAVAFX_PATH="${JAVAFX_PATH:-$MAP_TOOL_JAVA/lib}"

_javajx_classes="$(ls -U1 "$JAVAFX_PATH/javafx"*.jar | tr '\n' ':')"
_classpath="/usr/share/java/maptool/*:$_javajx_classes"
_default_jvm_opts='-Xmx768m -Xms32m -Xss8M "-Dsun.java2d.d3d=false" "-Djava.util.Arrays.useLegacyMergeSort=true" "-Dsentry.environment=production" "-Dfile.encoding=UTF-8" "-Dpolyglot.engine.WarnInterpreterOnly=false" "-DMAPTOOL_DATADIR=.maptool-rptools" "-XX:+ShowCodeDetailsInExceptionMessages" "--add-opens=java.desktop/java.awt=ALL-UNNAMED" "--add-opens=java.desktop/java.awt.geom=ALL-UNNAMED" "--add-opens=java.desktop/sun.awt.geom=ALL-UNNAMED" "--add-opens=java.base/java.util=ALL-UNNAMED" "--add-opens=javafx.web/javafx.scene.web=ALL-UNNAMED" "--add-opens=javafx.web/com.sun.webkit=ALL-UNNAMED" "--add-opens=javafx.web/com.sun.webkit.dom=ALL-UNNAMED" "--add-opens=java.desktop/javax.swing=ALL-UNNAMED" "--add-opens=java.desktop/sun.awt.shell=ALL-UNNAMED" "--add-opens=java.desktop/com.sun.java.swing.plaf.windows=ALL-UNNAMED"'

set -- \
        -classpath "$_classpath" \
        'net.rptools.maptool.client.LaunchInstructions' \
        "$@"

eval "set -- $(
        printf '%s\n' "$_default_jvm_opts $JAVA_OPTS $MAP_TOOL_OPTS" |
        xargs -n1 |
        sed ' s~[^-[:alnum:]+,./:=@_]~\\&~g; ' |
        tr '\n' ' '
    )" '"$@"'

exec "$MAP_TOOL_JAVA/bin/java" "$@"
