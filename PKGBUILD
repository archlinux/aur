# Maintainer: Grey Christoforo <first name at last name dot net>

pkgbase=python-lmfit
pkgname=('python-lmfit' 'python2-lmfit')
pkgver=0.9.9
pkgrel=1
pkgdesc="Least-Squares Minimization with Constraints for Python"
arch=('any')
url="http://lmfit.github.io/lmfit-py/"
license=('BSD')
source=(https://github.com/lmfit/lmfit-py/archive/${pkgver}.tar.gz)
md5sums=('6df6cd154fd2eab9f78e8515a823ffe3')

#check() {
#  cd "$srcdir/lmfit-py-$pkgver"
#  nosetests3 tests
#}

package_python-lmfit(){
  checkdepends=('python-nose')
  depends=('python' 'python-numpy' 'python-scipy' 'python-asteval')
  cd "$srcdir/lmfit-py-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-lmfit(){
  checkdepends=('python2-nose')
  depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-asteval')
  cd "$srcdir/lmfit-py-$pkgver"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:ts=2:sw=2:et:
