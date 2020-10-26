#!/bin/sh
exec /usr/bin/java -Xms512m -Xmx2048m -jar '/usr/share/java/juicebox/juicebox.jar' "$@"
