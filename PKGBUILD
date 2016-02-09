# Contributor: Francois Boulogne <fboulogne at april dot org>
# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=python-bcolz
_pkgname=bcolz
pkgver=0.12.1
pkgrel=1
pkgdesc="columnar and compressed data containers."
arch=('any')
url="https://bcolz.readthedocs.org/"
license=('BSD')
depends=('python' 'python-numpy')
optdepends=('python-numexpr')
makedepends=('python-setuptools')
source=(https://pypi.python.org/packages/source/b/bcolz/bcolz-$pkgver.tar.gz)
sha256sums=('a8dafa42cd4f3ca130ecb81f7e778204a12c2180c18fd570ef753de58ee7ddbd')

package(){
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:ts=2:sw=2:et:
