# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-bcolz
_pkgname=bcolz
pkgver=0.9.0
pkgrel=2
pkgdesc="columnar and compressed data containers."
arch=('any')
url="https://bcolz.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy')
optdepends=('python-numexpr')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/b/bcolz/bcolz-$pkgver.tar.gz)
sha256sums=('086b1ad62accf6b45e9386edfa23ccc9f8a1feaec5803e7f39753139eb016a50')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
