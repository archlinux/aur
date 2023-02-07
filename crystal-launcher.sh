#!/bin/sh
# Based on:
# https://wiki.archlinux.org/title/Java_package_guidelines

# Force execution in the standard path
mkdir -p "$HOME/Crystal-Launcher"
cd "$HOME/Crystal-Launcher"

# Run the app correctly, using most of the parameters
# inside the reverse engineered launcher
exec /usr/bin/java \
    -Dfile.encoding=UTF-8 \
    -Djava.net.preferIPv4Stack=true \
    -Dprism.forceGPU=true \
    -Dprism.verbose=true \
    -Xmx256M \
    -Xms128M \
    --add-opens java.desktop/sun.awt.X11=ALL-UNNAMED \
    -cp '/usr/share/java/crystal-launcher.jar' \
    ovh.leszczu8023.crystalwrapper.Main "$@"
