#!/bin/bash
export _JAVA_OPTIONS='-Dsun.java2d.opengl=true -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dfile.encoding="UTF-8"'
export LD_LIBRARY_PATH='/usr/lib/'
export LD_PRELOAD='/usr/lib/libjportaudio.so'
cd "/opt/beatoraja"
SHUT_UP_TACHI=yes java -Xms1g -Xmx4g -cp beatoraja.jar:ir/* -jar LR2oraja-endlessdream.jar
