#!/bin/sh
# Run Ramus IDEF0, DFD Modeler - Visual editor

for name in /usr/share/java/ramus-modeler/*.jar ; do
  CP=$CP:$name
done


# Set the initial and maximum JVM heap size
JAVA_HEAP_MAX_SIZE=192

# Start jEdit
exec java -cp $CP -Xmx${JAVA_HEAP_MAX_SIZE}M -Dawt.useSystemAAFontSettings=lcd com.ramussoft.local.Main "$@"
