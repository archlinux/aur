# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-lmfit
pkgver=0.9.8
pkgrel=1
pkgdesc="Least-Squares Minimization with Constraints for Python"
arch=('any')
url="http://lmfit.github.io/lmfit-py/"
license=('BSD')
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=(https://github.com/lmfit/lmfit-py/archive/${pkgver}.tar.gz)

build() {
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py build
}

#check() {
#  cd "$srcdir/lmfit-py-$pkgver"
#  nosetests3 tests
#}

package(){
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
md5sums=('56744e7bb1033a8ff0a69b6365c8b323')
