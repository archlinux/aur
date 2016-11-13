# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pymisp
_pyname=PyMISP
pkgname=('python-pymisp' 'python2-pymisp')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=2.4.53
pkgrel=2
pkgdesc="API for MISP."
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('BSD2')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/MISP/PyMISP/archive/v${pkgver}.tar.gz")
sha512sums=('fbdd28c337dc05ce8169a15dcc817b6f70a35217113a5f0f277d03ef66a351c41e5b0083257c187aebade3e0ecae82c6acffb032e687c754770518a44c063b65')

package_python-pymisp() {
  depends=('python')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

}

package_python2-pymisp() {
  depends=('python2')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"

}

# vim:set et sw=2 ts=2 tw=79:
