#!/bin/sh
JAVA_HOME=/usr/lib/jvm/java-17-openjdk
JFX_PATH=$JAVA_HOME/lib

# Solve incompatibilites with jrt.fs
"$JAVA_HOME/bin/java" --module-path "$JFX_PATH/javafx.base.jar:$JFX_PATH/javafx.controls.jar:$JFX_PATH/javafx.graphics.jar:$JFX_PATH/javafx.fxml.jar" --add-modules=javafx.base,javafx.graphics,javafx.controls,javafx.fxml -jar /usr/share/java/chunky/ChunkyLauncher.jar --launcher --noRetryJavafx --javaOptions "--module-path $JFX_PATH/javafx.base.jar:$JFX_PATH/javafx.controls.jar:$JFX_PATH/javafx.graphics.jar:$JFX_PATH/javafx.fxml.jar --add-modules=javafx.base,javafx.graphics,javafx.controls,javafx.fxml" "$@"
