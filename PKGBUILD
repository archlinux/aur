# Maintainer: Jeremy Audet <jerebear@protonmail.com>
# Contributor: jose <jose1711 [at] gmail (dot) com>

pkgname=osmfilter
pkgver=1.4.4
pkgrel=1
epoch=2
pkgdesc='A tool to filter OpenStreetMap data files for specific tags.'
url='https://wiki.openstreetmap.org/wiki/Osmfilter'
license=(AGPL3)
arch=(i686 x86_64)
depends=(glibc)
source=("http://m.m.i24.cc/${pkgname}.c")
sha256sums=('4a5e86c5640826f812eefbd365b85c1492788bb69c564a3ccb322d615497cf61')

build() {
  gcc "${pkgname}.c" -O3 -o "${pkgname}"
}

package() {
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
