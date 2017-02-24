# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
pkgbase=python-pymisp
_pyname=PyMISP
pkgname=('python-pymisp' 'python2-pymisp')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
optdepends=('python-pyme' 'python2-pyme')
pkgver=2.4.65
pkgrel=1
pkgdesc="API for MISP."
arch=('any')
url="https://github.com/MISP/PyMISP/"
license=('BSD2')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/MISP/PyMISP/archive/v${pkgver}.tar.gz")
sha512sums=('b69882ccbd4adae839633a81e175c54910f13a84d5ce73f46385c75b4d11bde91586673a46a543f47808177bb427b828c5161f89c4792a13df28f1eaba59da64')

package_python-pymisp() {
  depends=('python' 'python-jsonschema' 'python-requests' 'python-dateutil')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"

}

package_python2-pymisp() {
  depends=('python2' 'python2-jsonschema' 'python2-requests' 'python2-dateutil')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"

}

# vim:set et sw=2 ts=2 tw=79:
