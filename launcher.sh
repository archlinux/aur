#!/bin/sh
mkdir -p ~/.local/share/vpin-studio
cd ~/.local/share/vpin-studio

if [ ! -d resources ];
then
	cp -r /opt/vpin-studio-client/resources ~/.local/share/vpin-studio
fi

/usr/lib/jvm/zulu-jre25-fx/bin/java \
  --add-exports=javafx.graphics/com.sun.javafx.iio=ALL-UNNAMED \
  --add-exports=javafx.graphics/com.sun.javafx.iio.common=ALL-UNNAMED \
  --enable-native-access=javafx.graphics \
  --enable-native-access=javafx.web \
  -jar /opt/vpin-studio-client-bin/vpin-studio-ui.jar
