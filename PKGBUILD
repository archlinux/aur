# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gnucash-select
pkgver=2.10
pkgrel=1
pkgdesc="GnuCash File Selector"
url="https://github.com/bulletmark/$pkgname"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python>=3.10" "python-platformdirs" "python-argparse-from-file")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('59eae71ab89fcbb486379f60db265bb2')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
