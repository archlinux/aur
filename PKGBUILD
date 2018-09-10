# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=raise-or-run
pkgver=1.0
pkgrel=1
pkgdesc="Linux shell script to raise app window, or run app if window not already open"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("bash" "wmctrl")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('2aa282e43dce79d666f19b2b5104fa98')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
