# Maintainer: Thomas Wucher <arch (at) thomaswucher (dot) de>
pkgname=stress-ng
pkgver=0.10.19
pkgrel=1
pkgdesc="stress-ng will stress test a computer system in various selectable ways"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://kernel.ubuntu.com/~cking/${pkgname}/"
license=('GPL')
depends=()
source=("http://kernel.ubuntu.com/~cking/tarballs/${pkgname}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('0f0db52513df9c49a39af87195d27ec9db7472e641279319323d07c874c1056d')

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}/" install
}
