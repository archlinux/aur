#!/bin/sh
mkdir -p ~/.config/freej2me &&
cd ~/.config/freej2me &&
exec /usr/bin/java -jar '/usr/share/java/freej2me/freej2me.jar' "$@"
