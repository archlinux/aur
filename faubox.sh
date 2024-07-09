#!/bin/sh

# set java memory options
JAVA_MEM="-Xms64m -Xmx2g -XX:NewRatio=8 -XX:MinHeapFreeRatio=10 -XX:MaxHeapFreeRatio=20"

# Required since open JDK 17 or newer
JAVA_ADD="--add-exports=java.base/sun.nio.ch=ALL-UNNAMED"
JAVA_ADD="$JAVA_ADD --add-opens=java.base/java.lang=ALL-UNNAMED"
JAVA_ADD="$JAVA_ADD --add-opens=java.base/java.lang.reflect=ALL-UNNAMED"
JAVA_ADD="$JAVA_ADD --add-opens=java.base/java.io=ALL-UNNAMED"
JAVA_ADD="$JAVA_ADD --add-exports=jdk.unsupported/sun.misc=ALL-UNNAMED"
JAVA_ADD="$JAVA_ADD --add-exports=java.desktop/sun.swing=ALL-UNNAMED"
JAVA_ADD="$JAVA_ADD --add-opens=java.desktop/javax.swing.plaf.synth=ALL-UNNAMED"
JAVA_ADD="$JAVA_ADD --add-opens=java.desktop/javax.swing.plaf.basic=ALL-UNNAMED"
JAVA_ADD="$JAVA_ADD --add-exports=java.desktop/sun.swing.plaf.synth=ALL-UNNAMED"
JAVA_ADD="$JAVA_ADD --add-exports=java.desktop/sun.swing.table=ALL-UNNAMED"

exec /usr/bin/java $JAVA_ADD $JAVA_MEM -Duser.home=$HOME -cp "/usr/share/java/faubox/FAUbox.jar" de.dal33t.Start "$@"
