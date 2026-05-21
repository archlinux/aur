#!/bin/bash
export _JAVA_AWT_WM_NONREPARENTING=1

JFX_MODS=""
if [ -d /usr/lib/jvm/java-21-openjfx/lib ]; then
    JFX_MODS="--module-path /usr/lib/jvm/java-21-openjfx/lib --add-modules javafx.controls,javafx.fxml"
elif [ -d /usr/lib/jvm/java-17-openjfx/lib ]; then
    JFX_MODS="--module-path /usr/lib/jvm/java-17-openjfx/lib --add-modules javafx.controls,javafx.fxml"
elif [ -d /usr/share/java/openjfx/lib ]; then
    JFX_MODS="--module-path /usr/share/java/openjfx/lib --add-modules javafx.controls,javafx.fxml"
fi

JAR=""
if [ -f /usr/share/java/fluxpass/fluxpass.jar ]; then
    JAR=/usr/share/java/fluxpass/fluxpass.jar
elif [ -f "$(dirname "$0")/target/fluxpass.jar" ]; then
    JAR="$(dirname "$0")/target/fluxpass.jar"
fi

if [ -z "$JAR" ]; then
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    echo "Building FluxPass..."
    cd "$SCRIPT_DIR" && mvn package -q
    JAR="$SCRIPT_DIR/target/fluxpass.jar"
fi

exec java $JFX_MODS -jar "$JAR" "$@"
