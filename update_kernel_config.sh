#!/bin/sh
wget https://git.archlinux32.org/packages/plain/core/linux/config.i686 \
     -O config.i686
wget 'https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/linux/trunk/config' \
     -O config.x86_64
