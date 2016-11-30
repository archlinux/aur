# Maintainer: Tatsuyuki Ishi <ishitatsuyuki at gmail dot com>
pkgname=('python-arrow' 'python2-arrow')
pkgver=0.10.0
pkgrel=1
pkgdesc="Better dates and times for Python"
arch=('any')
url="http://crsmithdev.com/arrow/"
license=('GPL')
makedepends=('python' 'python-dateutil' 'python-nose' 'python2' 'python2-dateutil' 'python2-nose')
source=("https://files.pythonhosted.org/packages/source/a/arrow/arrow-${pkgver}.tar.gz")
sha256sums=('805906f09445afc1f0fc80187db8fe07670e3b25cdafa09b8d8ac264a8c0c722')

package_python-arrow() {
  depends=('python' 'python-dateutil' 'python-nose')
  cd "${srcdir}/arrow-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-arrow() {
  depends=('python2' 'python2-dateutil' 'python2-nose')
  cd "${srcdir}/arrow-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
