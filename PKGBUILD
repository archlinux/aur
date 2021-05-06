# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=parpd
pkgver=1.7
pkgrel=2
pkgdesc="Proxy-ARP daemon"
arch=(i686 x86_64)
url="https://roy.marples.name/projects/parpd"
license=(BSD)
source=("https://roy.marples.name/downloads/parpd/$pkgname-$pkgver.tar.xz")
sha256sums=('f1f2ed753243b86205922ab0ec1cd0f426779e6b8c273206f0568e819a3fe3b4')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" BINDIR="/usr/bin" install
}

# vim: ts=2:sw=2:et
