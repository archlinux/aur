# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=cdhist
pkgver=1.2
pkgrel=1
pkgdesc="Bash cd history"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
install=install.sh
md5sums=('1b584b301d3216effb5e36a1be6aac1d')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
