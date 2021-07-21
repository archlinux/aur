# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gnucash-select
pkgver=1.7
pkgrel=1
pkgdesc="GnuCash File Selector"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python-pysimplegui")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('b1e0f648902220285d7838cbe73a5577')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
