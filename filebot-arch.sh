#!/bin/bash

# force JVM language and encoding settings
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# FileBot settings
# EXTRACTOR="SevenZipNativeBindings"	# use the lib7-Zip-JBinding.so native library
# EXTRACTOR="SevenZipExecutable"	# use the 7z executable
EXTRACTOR="ApacheVFS"			# use Apache Commons VFS2 with junrar plugin

java $JAVA_OPTS -Dunixfs=false -DuseGVFS=false -DuseExtendedFileAttributes=true -DuseCreationDate=false -Dfile.encoding="UTF-8" -Djava.net.useSystemProxies=true -Dsun.net.client.defaultConnectTimeout=10000 -Dsun.net.client.defaultReadTimeout=60000 -Djna.nosys=true -Dapplication.deployment=aur -Dapplication.update=skip -Dnet.filebot.Archive.extractor="$EXTRACTOR" -Dnet.filebot.AcoustID.fpcalc="fpcalc" -Dapplication.dir=$HOME/.filebot -Djava.io.tmpdir=/tmp/.filebot -Djna.library.path=/usr/share/java -jar /usr/share/java/filebot/filebot.jar "$@"
