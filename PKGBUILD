# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=osmconvert
pkgver=0.8.7
pkgrel=1
epoch=2
pkgdesc='OpenStreetMap file format converter (.osm, .o5m, and .pbf)'
url='http://wiki.openstreetmap.org/wiki/Osmconvert'
license=(AGPL3)
arch=(i686 x86_64)
depends=(zlib)
source=("http://m.m.i24.cc/${pkgname}.c")
sha256sums=('71168e2520ddc681c621f4ab26a935c110d6c05517d299e59e9f08824368fb78')

build() {
  gcc "${pkgname}.c" -lz -O3 -o "${pkgname}"
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
