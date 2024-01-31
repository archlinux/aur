#!/bin/bash

opensuse="Tumbleweed"
mozillarpm="122.0-3.3"
stdrpm="122.0-2.1"

echo "case \$_arch in"
for arch in x86_64 i686
do
  echo "  $arch) sha256sums=(\"$(curl -L "https://download.opensuse.org/repositories/mozilla/openSUSE_$opensuse/$arch/MozillaFirefox-$mozillarpm.$arch.rpm" 2> /dev/null | sha256sum | awk '{print $1}')\") ;;"
done
for arch in aarch64
do
  echo "  $arch) sha256sums=(\"$(curl -L "https://download.opensuse.org/ports/$arch/${opensuse,,}/repo/oss/$arch/MozillaFirefox-$stdrpm.$arch.rpm" 2> /dev/null | sha256sum | awk '{print $1}')\") ;;"
done
echo "  *) sha256sums=(SKIP) ;;"
echo "esac"
