#!/bin/bash

if [ -d ~/.local/share/rkimer ]; then
	echo "Local dir exists, skipping..."
else
	mkdir ~/.local/share/rkimer
fi

cd ~/.local/share/rkimer && java -jar /usr/share/java/rkimer/rkimer.jar
