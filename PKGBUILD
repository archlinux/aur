# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: Jose Riha <jose1711 [at] gmail (dot) com>

pkgname=osmupdate
pkgver=0.4.5
pkgrel=1
pkgdesc='Download, manipulate and apply OpenStreetMap changefiles'
url='https://wiki.openstreetmap.org/wiki/Osmupdate'
license=(AGPL3)
arch=(i686 x86_64)
depends=(osmconvert wget)
optdepends=('gzip: to write gzip compressed files')
source=('http://m.m.i24.cc/osmupdate.c')
sha256sums=('9e72144bef15e461ce39c066a3015088d2126c27e2f78636d0deccab380f3cc1')

build() {
  gcc -O3 -oosmupdate osmupdate.c
}

package() {
  install -Dm755 osmupdate "${pkgdir}/usr/bin/osmupdate"
}

# vim:set ts=2 sw=2 et:
