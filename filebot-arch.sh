#!/bin/bash

# force JVM language and encoding settings
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"


# choose extractor
EXTRACTOR="ApacheVFS"			# use Apache Commons VFS2 with junrar plugin
# EXTRACTOR="SevenZipExecutable"	# use the 7z executable
# EXTRACTOR="SevenZipNativeBindings"	# use the lib7-Zip-JBinding.so native library

# start filebot
java -Dunixfs=false -DuseGVFS=false -DuseExtendedFileAttributes=true -DuseCreationDate=false -Dfile.encoding="UTF-8" -Dsun.jnu.encoding="UTF-8" -Djava.net.useSystemProxies=false -Djna.nosys=true -Dapplication.deployment=portable -Dnet.filebot.Archive.extractor="$EXTRACTOR" -Dnet.filebot.AcoustID.fpcalc="fpcalc" -Dapplication.dir=$HOME/.config/filebot -Djava.io.tmpdir=/tmp/filebot -Dapplication.update=skip -Djna.library.path=/usr/share/java $JAVA_OPTS -jar /usr/share/java/filebot/filebot.jar "$@"
