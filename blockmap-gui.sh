#!/bin/sh
for name in /usr/share/java/blockmap/*.jar ; do
  CP=$CP:$name
done
exec /usr/bin/java -cp $CP de.piegames.blockmap.gui.standalone.GuiMainLauncher "$@"
