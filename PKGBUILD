# Maintainer: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.11.02
pkgrel=1
pkgdesc="stress-ng will stress test a computer system in various selectable ways"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://kernel.ubuntu.com/~cking/${pkgname}/"
license=('GPL')
depends=()
source=("http://kernel.ubuntu.com/~cking/tarballs/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('ad1a6fca8f90f67a4364aa6ff0c406995960dc4f8689e9d5289fc083e1d8986f')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
