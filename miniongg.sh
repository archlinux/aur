#!/bin/sh
VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
if [ $(vercmp 1.9 "$VERSION") -le 0 ]; then
	java --module-path=/usr/lib/jvm/default/lib/javafx.web.jar:/usr/lib/jvm/default/lib/javafx.graphics.jar:/usr/lib/jvm/default/lib/javafx.base.jar:/usr/lib/jvm/default/lib/javafx.swing.jar:/usr/lib/jvm/default/lib/javafx.fxml.jar:/usr/lib/jvm/default/lib/javafx.controls.jar:/usr/lib/jvm/default/lib/javafx-swt.jar:/usr/lib/jvm/default/lib/javafx.media.jar \
	  --add-modules=javafx.swing,javafx.graphics,javafx.fxml,javafx.media,javafx.web \
	  --add-reads javafx.graphics=ALL-UNNAMED \
	  --add-opens javafx.controls/com.sun.javafx.charts=ALL-UNNAMED \
	  --add-opens javafx.graphics/com.sun.javafx.iio=ALL-UNNAMED \
	  --add-opens javafx.graphics/com.sun.javafx.iio.common=ALL-UNNAMED \
	  --add-opens javafx.graphics/com.sun.javafx.css=ALL-UNNAMED \
	  --add-opens javafx.graphics/javafx.scene.image=ALL-UNNAMED\
	  --add-opens javafx.base/com.sun.javafx.runtime=ALL-UNNAMED \
	  --add-opens java.base/java.lang=ALL-UNNAMED \
	  -jar /usr/share/java/minion/Minion-jfx.jar
else
	java -jar /usr/share/java/minion/Minion-jfx.jar
fi
