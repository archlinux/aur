#!/bin/sh
wget https://git.archlinux32.org/packages/plain/core/linux/config.i686 \
     -O config.i686
wget 'https://git.archlinux.org/svntogit/packages.git/plain/trunk/config?h=packages/linux' \
     -O config.x86_64
