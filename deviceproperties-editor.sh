#!/usr/bin/env sh

# Check if we have openjdk17 installed
for version in $(archlinux-java status); do
    if [[ $version == "java-17-openjdk" ]]; then
        export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"
        cd /opt/DataExplorer
        ./DevicePropertiesEditor
        exit 0
    fi
done

echo "You do not have java-17-openjdk installed."
exit 1
