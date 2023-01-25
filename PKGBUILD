# Maintainer: Husam Bilal <me@husam.dev>

pkgname=php7-symlinks
pkgver=1
pkgrel=1
pkgdesc='Symlinks PHP7 binaries and configuration without the "7" suffix'
arch=('any')
depends=('php74')
provides=('php')
conflicts=('php')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"
  ln -s php74 php

  install -dm755 "$pkgdir/usr/lib/"
  cd "$pkgdir/usr/lib/"
  ln -s php74 php

  install -dm755 "$pkgdir/etc/"
  cd "$pkgdir/etc/"
  ln -s php74 php
}
