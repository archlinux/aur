# Maintainer: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.12.02
pkgrel=1
pkgdesc="stress-ng will stress test a computer system in various selectable ways"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://kernel.ubuntu.com/~cking/${pkgname}/"
license=('GPL')
depends=()
source=("http://kernel.ubuntu.com/~cking/tarballs/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('f847be115f60d3ad7d37c806fd1bfb1412aa3c631fca581d6dc233322f50d6a5')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
