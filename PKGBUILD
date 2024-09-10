# Maintainer: El Bachir <bachiralfa@gmail.com>
#
pkgname=conway-screensaver
pkgver=1.0.1
pkgrel=1
pkgdesc="Conway's Game of Life (Terminal Screensaver)"
arch=('x86_64')
url="https://github.com/cdkw2/conway-screensaver"
license=('MIT')
depends=('glibc' 'ncurses')
source=("$pkgname-$pkgver.tar.gz::https://github.com/cdkw2/conway-screensaver/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bf7217ee0e212abfe093a3b4da1810c1e91cd004dede70b19ff422794d440b5e') 

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "conway-screensaver" "$pkgdir/usr/bin/conway-screensaver"
}
