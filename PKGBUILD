# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=timesched
pkgname=python-$_pkgname
pkgver=1.7
pkgrel=1
pkgdesc="Python module providing a simple time event scheduler"
url="https://github.com/bulletmark/$_pkgname"
license=("GPL3")
arch=("any")
depends=("python>=3.4")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
replaces=($_pkgname)
conflicts=($_pkgname)
sha1sums=('07262e40c9a27217cfa1fccd61e3394799488606')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
