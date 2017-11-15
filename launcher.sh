#!/bin/bash

java \
    -Declipse.application=org.eclipse.jdt.ls.core.id1 \
    -Dosgi.bundles.defaultStartLevel=4 \
    -Declipse.product=org.eclipse.jdt.ls.core.product \
    -noverify \
    -Xms1G \
    -jar /usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar \
    -configuration /usr/share/java/jdtls/config_linux \
    "$@"
