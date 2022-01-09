# Maintainer: Samuel Sloniker <sam@kj7rrv.com>
pkgname=desktop-like-mobile-config-firefox
pkgver=4.0.0
pkgrel=1
pkgdesc="Mobile configuration for Firefox - minimal changes from desktop"
arch=(any)
url="https://github.com/kj7rrv/desktop-like-mobile-config-firefox/"
license=('GPL3')
depends=(firefox)
source=("https://github.com/kj7rrv/desktop-like-mobile-config-firefox/archive/refs/tags/v4.0.0.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
sha256sums=('4563f05a07f0d17cc60bac49ec25a0a1499e2a2012727c820878f0dca83d9ddd')
