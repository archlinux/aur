# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=1.4.1
pkgrel=2
pkgdesc="Bash cd history"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
install=install.sh
md5sums=('00aed7afda3e9e99fd68df01a7f7be40')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
