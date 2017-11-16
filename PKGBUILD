# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=encfsui
pkgver=1.3
pkgrel=1
pkgdesc="Encrypted filesystem encfs GUI wrapper"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("encfs" "fuse2" "zenity" "xdg-utils")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('c79e2a84b2f1dfbd81f1b3ef86787aeb')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
