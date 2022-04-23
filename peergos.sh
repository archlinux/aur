#!/usr/bin/env sh
# maintainer jahway603 <3 for Arch & AUR
exec /usr/bin/java -Djava.library.path=native-lib -jar '/usr/share/java/peergos/peergos.jar' "$@"
