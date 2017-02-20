#!/bin/bash

# force JVM language and encoding settings
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

APP_ROOT=/usr/share/java/filebot
# add APP_ROOT to LD_LIBRARY_PATH
if [ ! -z "$LD_LIBRARY_PATH" ]; then
	export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$APP_ROOT"
else
	export LD_LIBRARY_PATH="$APP_ROOT"
fi

# choose extractor
EXTRACTOR="ApacheVFS"			# use Apache Commons VFS2 with junrar plugin
# EXTRACTOR="SevenZipExecutable"	# use the 7z executable
# EXTRACTOR="SevenZipNativeBindings"	# use the lib7-Zip-JBinding.so native library

# start filebot
java -Dunixfs=false -DuseGVFS=false -DuseExtendedFileAttributes=true -DuseCreationDate=false -Djava.net.useSystemProxies=false -Dapplication.deployment=portable -Dfile.encoding="UTF-8" -Dsun.jnu.encoding="UTF-8" -Djna.nosys=false -Djna.nounpack=true -Dnet.filebot.Archive.extractor="$EXTRACTOR" -Dnet.filebot.AcoustID.fpcalc="fpcalc" -Dapplication.dir=$HOME/.config/filebot -Djava.io.tmpdir=/tmp/filebot -Dapplication.update=skip -Djna.library.path=/usr/share/java $JAVA_OPTS -jar /usr/share/java/filebot/filebot.jar "$@"

