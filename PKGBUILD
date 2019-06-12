# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=zxcvbn-python
pkgname=('python2-zxcvbn' 'python-zxcvbn')
pkgbase=python2-zxcvbn
pkgver=4.4.28
pkgrel=1
pkgdesc="Password strength estimator"
arch=('any')
url="http://pypi.python.org/pypi/zxcvbn"
license=('Apache')
#source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
source=("https://github.com/dwolfhub/${_pythonmod}/archive/v$pkgver.tar.gz")
sha256sums=('b7275765acdf8028c21aa502d742e56de2252bac604c04ba5e336c39f88d5576')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools')

package_python2-zxcvbn() {
  depends=('python2')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}

package_python-zxcvbn() {
  depends=('python')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root=${pkgdir}
}
