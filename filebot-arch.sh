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
# EXTRACTOR="ApacheVFS"			# use Apache Commons VFS2 with junrar plugin
EXTRACTOR="SevenZipExecutable"	# use the 7z executable
# EXTRACTOR="SevenZipNativeBindings"	# use the lib7-Zip-JBinding.so native library

# start filebot
/usr/lib/jvm/java-8-openjdk/jre/bin/java -Dunixfs=false -DuseGVFS=true -Dnet.filebot.gio.GVFS="$XDG_RUNTIME_DIR/gvfs" -DuseExtendedFileAttributes=true -DuseCreationDate=false -Djava.net.useSystemProxies=true -Dapplication.deployment=AUR -Dfile.encoding="UTF-8" -Dsun.jnu.encoding="UTF-8" -Djna.nosys=true -Djna.nounpack=true -Dnet.filebot.Archive.extractor="$EXTRACTOR" -Dnet.filebot.AcoustID.fpcalc="fpcalc" -Dapplication.dir=$HOME/.config/filebot -Djava.io.tmpdir=/tmp/filebot -Dapplication.update=skip -Djna.library.path="$APP_ROOT" $JAVA_OPTS $FILEBOT_OPTS -jar $APP_ROOT/filebot.jar "$@"

