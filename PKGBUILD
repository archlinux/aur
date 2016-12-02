# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=encfsui
pkgver=1.1
pkgrel=1
pkgdesc="Encrypted filesystem encfs GUI wrapper"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("encfs" "fuse" "zenity" "xdg-utils")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('1559afbba51bfddb14663b9c9000a4c12b2bfade94c6c283171a9c52e03412a5')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
