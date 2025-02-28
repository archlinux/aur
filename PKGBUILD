# Maintainer: gatopeich <gatopeich@pm.me>
pkgname=gatotray
pkgver=4.1
pkgrel=20250228
pkgdesc="A lightweight graphical system monitor for the desktop tray"
arch=('x86_64')
url="https://github.com/gatopeich/gatotray"
license=('CC-BY')
depends=('gtk2')
source=("https://github.com/gatopeich/gatotray/archive/refs/tags/v$pkgver.$pkgrel.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver.$pkgrel"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.$pkgrel"
  make DESTDIR="$pkgdir" install
}
