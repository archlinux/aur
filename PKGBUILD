# Maintainer: mark.blakeney at bullet-systems dot net
pkgname=timesched
pkgver=1.5
pkgrel=2
pkgdesc="Python module providing a simple time event scheduler"
url="https://github.com/bulletmark/$pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.4")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha1sums=('5a0a2f2c050f1fb5f7a0544489c67d2545f96b96')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
