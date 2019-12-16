# Maintainer: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.10.14
pkgrel=1
pkgdesc="stress-ng will stress test a computer system in various selectable ways"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://kernel.ubuntu.com/~cking/${pkgname}/"
license=('GPL')
depends=()
source=("http://kernel.ubuntu.com/~cking/tarballs/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('d8ba86ddfcf4695389575ae0d426d7681b03d1803bf8f19c691d7e4c73975f51')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
