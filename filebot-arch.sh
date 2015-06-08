#!/bin/bash
java -Dunixfs=false -DuseGVFS=false -DuseExtendedFileAttributes=true -DuseCreationDate=false -Dfile.encoding=UTF-8 -Djava.net.useSystemProxies=true -Dsun.net.client.defaultConnectTimeout=10000 -Dsun.net.client.defaultReadTimeout=60000 -Djna.nosys=true -Dapplication.deployment=aur -Dapplication.update=skip -Dapplication.dir=$HOME/.filebot -Djava.io.tmpdir=$HOME/.filebot/temp -Djna.library.path=/usr/share/java/filebot -Djava.library.path=/usr/share/java/filebot -jar /usr/share/java/filebot/filebot.jar "$@"

