#!/bin/sh
for name in /usr/share/java/mtg-desktop-companion/*.jar ; do
  CP=$CP:$name
done
exec /usr/bin/java -Xmx4096m -cp $CP org.magic.main.MtgDesktopCompanion "$@"