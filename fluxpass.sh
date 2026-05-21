#!/bin/bash
export _JAVA_AWT_WM_NONREPARENTING=1

JFX_MODS=""
for dir in /usr/lib/jvm/*/lib /usr/share/java/openjfx/lib /opt/javafx-sdk/lib; do
    if [ -f "$dir/javafx-controls.jar" ]; then
        JFX_MODS="--module-path $dir --add-modules javafx.controls,javafx.fxml"
        break
    fi
done

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
