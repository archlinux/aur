# Maintainer: Lennart Martens <monkeynator78@gmail.com>
pkgname=lusc-c
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux UEFI STUB Creator - the easy way"
arch=('x86_64')
url="https://github.com/lennart1978/lusc"
license=('MIT')
depends=()
makedepends=('gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lennart1978/lusc/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

