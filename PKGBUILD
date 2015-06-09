# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=osmconvert
pkgver=0.8.4
pkgrel=1
epoch=2
pkgdesc='OpenStreetMap file format converter (.osm, .o5m, and .pbf)'
url='http://wiki.openstreetmap.org/wiki/Osmconvert'
license=(AGPL3)
arch=(i686 x86_64)
depends=(zlib)
source=("http://m.m.i24.cc/${pkgname}.c")
sha256sums=('a26d7c27d13d6b7801da9f9744757295229d6c38ae0825e50972ee896a983881')

build() {
  gcc "${pkgname}.c" -lz -O3 -o "${pkgname}"
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
