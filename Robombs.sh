#!/usr/bin/sh
cd /usr/share/robombs
java -Xmx768m -Xms256m -Dorg.lwjgl.librarypath="/usr/share/lwjgl2/native/linux" \
     -Djava.librarypath="/usr/share/lwjgl2/native/linux" \
     -Dorg.lwjgl.util.NoChecks=false \
     -cp lib/jpct/jpct.jar:/usr/share/lwjgl2/jar/lwjgl.jar:/usr/share/lwjgl2/jar/lwjgl-debug.jar:/usr/share/lwjgl2/jar/lwjgl_util.jar:jinput.jar:bin/bin.jar:. robombs.game.startup.StartUp
