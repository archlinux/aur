#!/bin/sh
wget https://git.archlinux32.org/packages/plain/extra/linux-zen/config \
     -O config.i686
wget 'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/linux-zen/trunk/config' \
     -O config.x86_64
