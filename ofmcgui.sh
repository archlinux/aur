#!/bin/sh
fakewd="/tmp/ofmcgui_workdir"
mkdir -p "$fakewd"
ln -s "/usr/bin/ofmc" "$fakewd/ofmc"
cd "$fakewd"
java -jar \
    --module-path /usr/share/java/ofmcgui/lib \
    --add-modules=javafx.controls,javafx.fxml,javafx.graphics \
    --add-exports javafx.graphics/com.sun.javafx.geom=ALL-UNNAMED \
    --add-exports javafx.graphics/com.sun.javafx.scene.text=ALL-UNNAMED \
    --add-exports javafx.graphics/com.sun.javafx.text=ALL-UNNAMED \
    --add-opens javafx.graphics/javafx.scene=ALL-UNNAMED \
    --add-opens javafx.graphics/javafx.scene.text=ALL-UNNAMED \
    --add-opens javafx.graphics/com.sun.javafx.text=ALL-UNNAMED \
    /usr/share/java/ofmcgui/OFMCGUI.jar
