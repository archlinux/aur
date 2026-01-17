#!/bin/sh
mkdir -p ~/.local/share/vpin-studio
cd ~/.local/share/vpin-studio

if [ ! -d resources ];
then
	cp -r /opt/vpin-studio-client/resources ~/.local/share/vpin-studio
fi

/usr/lib/jvm/zulu11-fx-bin/bin/java -jar /opt/vpin-studio-client-bin/vpin-studio-ui.jar
