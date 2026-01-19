# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=gnucash-select
pkgver=2.8
pkgrel=1
pkgdesc="GnuCash File Selector"
url="https://github.com/bulletmark/$pkgname"
license=("GPL-3.0-or-later")
arch=("any")
depends=("python>=3.8" "python-platformdirs" "python-argparse-from-file")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('f4e0a3ce2776ba3cd0f3521b7d47a2a3')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
