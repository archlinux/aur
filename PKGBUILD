# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=encfsui
pkgver=1.0
pkgrel=1
pkgdesc="Encrypted filesystem encfs GUI wrapper"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("encfs" "zenity" "xdg-utils")
makedepends=("git")
source=("$pkgname-$pkgver::git+$url#tag=$pkgver")
md5sums=('SKIP')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
