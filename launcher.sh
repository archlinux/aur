#!/bin/sh

exec java \
    -Declipse.application=org.eclipse.jdt.ls.core.id1 \
    -Dosgi.bundles.defaultStartLevel=4 \
    -Declipse.product=org.eclipse.jdt.ls.core.product \
    -Dosgi.checkConfiguration=true \
    -Dosgi.sharedConfiguration.area=/usr/share/java/jdtls/config_linux \
    -Dosgi.sharedConfiguration.area.readOnly=true \
    -Dosgi.configuration.cascaded=true \
    -noverify \
    -Xms1G \
    -jar /usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar \
    "$@"
