# Maintainer: Husam Bilal <me@husam.dev>

pkgname=php-legacy-symlinks
pkgver=1
pkgrel=1
pkgdesc='Symlinks PHP legacy binaries and configuration without the "legacy" suffix'
arch=('any')
depends=('php-legacy')
provides=('php')
conflicts=('php')

package() {
  install -dm755 "$pkgdir/usr/bin/"
  cd "$pkgdir/usr/bin/"
  ln -s php-legacy php

  install -dm755 "$pkgdir/etc/"
  cd "$pkgdir/etc/"
  ln -s php-legacy php
}
