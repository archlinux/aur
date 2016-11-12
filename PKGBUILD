# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-terminaltables
_pyname=terminaltables
pkgname=('python-terminaltables' 'python2-terminaltables')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=3.1.0
pkgrel=3
pkgdesc="Generate simple tables in terminals from a nested list of strings"
arch=('any')
url="https://github.com/Robpol86/terminaltables"
license=('MIT')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/Robpol86/${_pyname}/archive/v${pkgver}.tar.gz")
sha512sums=('dc49458652fff8bc6094d316d84c9b8e9fca1a26e3230c0b668bc03ec8528793f4ef024e8032d4a56fbfabfdfd4a1142870f550f0b373ba6a42dd2e3ead3f501')

package_python-terminaltables() {
  depends=('python')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-terminaltables() {
  depends=('python2')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}

# vim:set et sw=2 ts=2 tw=79: 
