# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gnucash-select
pkgver=2.6.1
pkgrel=1
pkgdesc="GnuCash File Selector"
url="https://github.com/bulletmark/$pkgname"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python>=3.8" "python-platformdirs")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('34bdd31dd5d91f927bd407af0075815b')

package() {
  cd "$pkgname-$pkgver"
  make -d DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
