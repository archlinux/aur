# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=osmconvert
pkgver=0.8.5
pkgrel=1
epoch=2
pkgdesc='OpenStreetMap file format converter (.osm, .o5m, and .pbf)'
url='http://wiki.openstreetmap.org/wiki/Osmconvert'
license=(AGPL3)
arch=(i686 x86_64)
depends=(zlib)
source=("http://m.m.i24.cc/${pkgname}.c")
sha256sums=('9da0940912d1bc62223b962483fd796f92c959c48749806aee5806164e5875d7')

build() {
  gcc "${pkgname}.c" -lz -O3 -o "${pkgname}"
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
