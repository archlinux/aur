#!/bin/sh
java  -Xmx1500m \
    --add-exports java.desktop/com.sun.java.swing.plaf.windows=jide.common \
    --add-exports java.desktop/javax.swing.plaf.synth=jide.common \
    --add-exports java.desktop/sun.swing=jide.common \
    --add-exports java.desktop/sun.awt=jide.common \
    --add-exports java.desktop/sun.awt.image=jide.common \
    --add-exports java.desktop/sun.awt.shell=jide.common \
    --add-exports java.desktop/sun.awt.dnd=jide.common \
    --add-exports java.desktop/sun.awt.windows=jide.common \
    --add-exports java.base/sun.security.action=jide.common \
    -Dcom.sun.xml.bind.v2.bytecode.ClassTailor.noOptimize \
    -Dsun.java2d.uiScale=2 \
    --module-path=/usr/share/java/igv \
    --module=org.igv/org.broad.igv.tools.IgvTools gui "${@}"
    # -jar /usr/share/java/igv/igv.jar

# Disable a JAXB optimization that causes illegal access exceptions on Java 11
