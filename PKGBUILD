# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyionice
pkgver=1.0.1
pkgrel=1
pkgdesc='Tiny I/O Nice, a drop-in replacement for ionice'
arch=(x86_64)
url='https://github.com/xyproto/tinyionice'
license=(GPL2)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=(SKIP)

build() {
  make -C $pkgname-$pkgver
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname-$pkgver install
}
