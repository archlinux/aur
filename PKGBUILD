# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=1.4
pkgrel=1
pkgdesc="Bash cd history"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
install=install.sh
md5sums=('ae290028e891d6d46079fbd527b007c3')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
