# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gnucash-select
pkgver=2.2
pkgrel=1
pkgdesc="GnuCash File Selector"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python-pysimplegui")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('9c89029d4fd54a6cb19790baa4a93b1f')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
