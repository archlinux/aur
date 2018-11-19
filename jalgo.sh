#!/bin/sh
cd /usr/lib/jalgo
java -Djava.library.path=extlibs -Djava.ext.dirs=runtime/modules -Dawt.useSystemAAFontSettings=gasp -jar runtime/j-Algo.jar
