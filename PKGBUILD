# Maintainer: mark.blakeney at bullet-systems dot net
_pkgname=timesched
pkgname=python-$_pkgname
pkgver=1.6
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
sha1sums=('4b87a1a50c0d6609aa713d1a78c458dcee62c2fd')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
