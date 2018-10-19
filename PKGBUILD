# Maintainer: Cedric Girard <girard.cedric@gmail.com>
_pythonmod=zxcvbn-python
pkgname=('python2-zxcvbn' 'python-zxcvbn')
pkgbase=python2-zxcvbn
pkgver=4.4.27
pkgrel=1
pkgdesc="Password strength estimator"
arch=('any')
url="http://pypi.python.org/pypi/zxcvbn"
license=('Apache')
#source=("https://pypi.io/packages/source/${_pythonmod:0:1}/${_pythonmod}/${_pythonmod}-$pkgver.tar.gz")
source=("https://github.com/dwolfhub/${_pythonmod}/archive/v$pkgver.tar.gz")
sha256sums=('9b84927fff7b4cc557b63a49adbd74f7a92026e25edd9e1b2867c1610d15fa5d')

package_python2-zxcvbn() {
  depends=('python2')
  makedepends=('python2-setuptools')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python2 setup.py install --root=${pkgdir}
}

package_python-zxcvbn() {
  depends=('python')
  makedepends=('python-setuptools')
  cd ${srcdir}/${_pythonmod}-$pkgver
  python setup.py install --root=${pkgdir}
}
