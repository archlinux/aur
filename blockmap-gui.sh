#!/bin/sh
for name in /usr/share/java/blockmap/*.jar ; do
  CP=$CP:$name
done
archlinux-java-run -a 13 -- -cp $CP de.piegames.blockmap.gui.standalone.GuiMainLauncher "$@"
