#!/bin/sh
mkdir -p ~/.config/freej2me-plus &&
cd ~/.config/freej2me-plus &&
exec /usr/bin/java -jar '/usr/share/java/freej2me-plus/freej2me-sdl.jar' "$@"
