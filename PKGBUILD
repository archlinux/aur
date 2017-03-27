# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=osmconvert
pkgver=0.8.6
pkgrel=1
epoch=2
pkgdesc='OpenStreetMap file format converter (.osm, .o5m, and .pbf)'
url='http://wiki.openstreetmap.org/wiki/Osmconvert'
license=(AGPL3)
arch=(i686 x86_64)
depends=(zlib)
source=("http://m.m.i24.cc/${pkgname}.c")
sha256sums=('f298deff7d187cc0e509a7601496137552050a63a9d46196e4b991a65aa7e683')

build() {
  gcc "${pkgname}.c" -lz -O3 -o "${pkgname}"
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
