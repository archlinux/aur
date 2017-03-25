# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=parpd
pkgver=1.7
pkgrel=1
pkgdesc="Proxy-ARP daemon"
arch=(i686 x86_64)
url="https://roy.marples.name/projects/parpd"
license=(BSD)
source=("https://roy.marples.name/downloads/parpd/parpd-1.7.tar.xz")
sha256sums=('f1f2ed753243b86205922ab0ec1cd0f426779e6b8c273206f0568e819a3fe3b4')

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" BINDIR="/usr/bin" install
}

# vim: ts=2:sw=2:et
