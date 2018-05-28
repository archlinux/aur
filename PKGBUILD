# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=osmconvert
pkgver=0.8.10
pkgrel=1
epoch=2
pkgdesc='OpenStreetMap file format converter (.osm, .o5m, and .pbf)'
url='https://wiki.openstreetmap.org/wiki/Osmconvert'
license=(AGPL3)
arch=(i686 x86_64)
depends=(zlib)
source=("http://m.m.i24.cc/${pkgname}.c")
sha256sums=('db494af3af9372d9451cee10972d497a796a8a6cfeaefed32988eac211e6f4a5')

build() {
  gcc "${pkgname}.c" -lz -O3 -o "${pkgname}"
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
