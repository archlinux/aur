#!/bin/sh

if [ ! -d ~/.projectx ] ; then
        mkdir ~/.projectx
fi

if [ "$#" -eq 0 ] ; then
	cd ~/.projectx 
fi
java -jar -Djava.library.path=/usr/share/java/projectx/lib /usr/share/java/projectx/projectx.jar "$@"
