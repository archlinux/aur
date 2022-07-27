# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=tinyionice
pkgver=1.0.2
pkgrel=2
pkgdesc='ionice in 300 lines of C'
arch=(x86_64)
url='https://github.com/xyproto/tinyionice'
license=(GPL2)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
b2sums=('7d7a6963c39d6973da2f07018153e9b5e5216ed698ba8ce309ac3f8e816e82fd7a94aa2398277ed9501f04b9e43d6e9477cf9754335e7f350b53fb4f7946b3d1')

build() {
  make -C $pkgname-$pkgver
}

package() {
  DESTDIR="$pkgdir" make -C $pkgname-$pkgver install
}
