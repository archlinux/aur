# Maintainer: Ivan 'ivabus' Bushchik ivabus@ivabus.dev -> https://github.com/ivabus

pkgname=plainbase
pkgver=0.4.2
pkgrel=2
pkgdesc="plainDE base files"
arch=(any)
url="https://plainde.org"
license=(GPL3)
makedepends=(git)
source=("git+https://github.com/plainDE/plainBase.git#tag=${pkgver}")
sha256sums=('SKIP')

package() {
  mkdir -p $pkgdir/usr
  cp -r $srcdir/plainBase/usr/* $pkgdir/usr/
  chmod 755 $pkgdir/usr/share/plainDE/tools/*
}
