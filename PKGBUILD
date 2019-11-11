# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=timesched
pkgver=1.4
pkgrel=1
pkgdesc="Python module providing a simple time event scheduler"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.4")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('341b162baab852670350e3def8aa0ee222f239d1')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
