#!/bin/sh
java --module-path=/usr/lib/jvm/default/lib/javafx.web.jar:/usr/lib/jvm/default/lib/javafx.graphics.jar:/usr/lib/jvm/default/lib/javafx.base.jar:/usr/lib/jvm/default/lib/javafx.swing.jar:/usr/lib/jvm/default/lib/javafx.fxml.jar:/usr/lib/jvm/default/lib/javafx.controls.jar:/usr/lib/jvm/default/lib/javafx-swt.jar:/usr/lib/jvm/default/lib/javafx.media.jar \
  --add-modules=javafx.swing,javafx.graphics,javafx.fxml,javafx.media,javafx.web \
  --add-reads javafx.graphics=ALL-UNNAMED \
  --add-opens javafx.controls/com.sun.javafx.charts=ALL-UNNAMED \
  --add-opens javafx.graphics/com.sun.javafx.iio=ALL-UNNAMED \
  --add-opens javafx.graphics/com.sun.javafx.iio.common=ALL-UNNAMED \
  --add-opens javafx.graphics/com.sun.javafx.css=ALL-UNNAMED \
  --add-opens javafx.graphics/javafx.scene.image=ALL-UNNAMED\
  --add-opens javafx.base/com.sun.javafx.runtime=ALL-UNNAMED \
  -jar /usr/share/java/minion/Minion-jfx.jar
