# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=osmupdate
pkgver=0.4.4
pkgrel=1
pkgdesc='Download, manipulate and apply OpenStreetMap changefiles'
url='http://wiki.openstreetmap.org/wiki/Osmupdate'
license=(AGPL3)
arch=(i686 x86_64)
depends=(osmconvert wget)
optdepends=('gzip: to write gzip compressed files')
source=('http://m.m.i24.cc/osmupdate.c')
sha256sums=('54760538cd325efa763a7445d15b4dde140aeafed612f626b31f52a510d6e14c')

build() {
  gcc -O3 -oosmupdate osmupdate.c
}

package() {
  install -Dm755 osmupdate "${pkgdir}/usr/bin/osmupdate"
}

# vim:set ts=2 sw=2 et:
