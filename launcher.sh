#!/bin/bash

# copy the configuration folder to tmp to be writable
tmp_dir="$(mktemp -d /tmp/jdtls.XXXXX)"
cp -R /usr/share/java/jdtls/config_linux "${tmp_dir}"
# and ensure that it is removed on exit
trap "{ rm -rf ${tmp_dir}; }" EXIT

java \
    -Declipse.application=org.eclipse.jdt.ls.core.id1 \
    -Dosgi.bundles.defaultStartLevel=4 \
    -Declipse.product=org.eclipse.jdt.ls.core.product \
    -noverify \
    -Xms1G \
    -jar /usr/share/java/jdtls/plugins/org.eclipse.equinox.launcher_*.jar \
    -configuration "${tmp_dir}/config_linux" \
    "$@"
