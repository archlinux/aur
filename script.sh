#!/bin/sh
mkdir -p /tmp/mcpelauncher-hx
cd /tmp/mcpelauncher-hx
for pkg in 'lib32-check' 'mcpelauncher-linux-git' 'mcpelauncher-ui-git'
do
    echo "====Downloading ${pkg}===="
    git clone "https://github.com/ChristopherHX/"$pkg".git" $pkg
    cd $pkg
    git pull
    echo "====Installing ${pkg}===="
    makepkg --syncdeps --noconfirm --install --cleanbuild --needed
    cd ../
done
rm -rf /tmp/mcpelauncher-hx
