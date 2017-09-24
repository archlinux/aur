# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=osmfilter
pkgver=1.4.3
pkgrel=1
epoch=2
pkgdesc='A tool to filter OpenStreetMap data files for specific tags.'
url='http://wiki.openstreetmap.org/wiki/Osmfilter'
license=(AGPL3)
arch=(i686 x86_64)
depends=(glibc)
source=("http://m.m.i24.cc/${pkgname}.c")
sha256sums=('c32130692a4eede92b2a9c46458fa151e435cfdf94c22ec07cb63677b73838c3')

build() {
  gcc "${pkgname}.c" -O3 -o "${pkgname}"
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
