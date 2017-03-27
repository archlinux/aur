# Maintainer: Jeremy "Ichimonji10" Audet <ichimonji10 at gmail dot com>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=osmfilter
pkgver=1.4.1
pkgrel=1
epoch=2
pkgdesc='A tool to filter OpenStreetMap data files for specific tags.'
url='http://wiki.openstreetmap.org/wiki/Osmfilter'
license=(AGPL3)
arch=(i686 x86_64)
depends=(glibc)
source=("http://m.m.i24.cc/${pkgname}.c")
sha256sums=('e19ea07d907325c7a1a51a3409f82a209478ee6f945c7891b4a1e5cf5bf4cef5')

build() {
  gcc "${pkgname}.c" -O3 -o "${pkgname}"
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
