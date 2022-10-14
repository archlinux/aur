#!/bin/sh
cd /opt/brailleblaster/
if [ ! -z "$JAVA_HOME" ]; then
	cmd="$JAVA_HOME/bin/java"
else
	if which java; then
		cmd="java"
	else
		echo "java not found on \$PATH"
		exit 1
	fi
fi

$cmd -cp lib/linux-x86_64/org.eclipse.swt.gtk.linux.x86_64.jar:brailleblaster.jar org.brailleblaster.Main
