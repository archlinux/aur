#!/bin/sh

if [ ! -d ~/.projectx ] ; then
        mkdir ~/.projectx
fi

if [ "$#" -eq 0 ] ; then
	cd ~/.projectx 
fi

java -Djava.library.path=/usr/lib/projectx -jar /usr/share/java/projectx/ProjectX.jar "$@"
