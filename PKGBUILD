# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=encfsui
pkgver=1.5
pkgrel=1
pkgdesc="Encrypted filesystem encfs GUI wrapper"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("encfs" "fuse2" "zenity" "xdg-utils")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('9bf3d14fdeee21ba561fffcc6821e3d6')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
