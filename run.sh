#!/bin/sh
PORT=${1:8080}
shift
exec /usr/bin/java -Dfile.encoding=utf-8 -Xms256M -Xmx1024M -Dwarbler.port=$PORT -jar '/usr/share/java/tabula/tabula.jar' "$@"
