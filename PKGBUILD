# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgbase=python-pypdns
_pyname=PyPDNS
pkgname=('python-pypdns' 'python2-pypdns')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
pkgver=1.3
pkgrel=2
pkgdesc="Python API for PDNS."
arch=('any')
url="https://github.com/CIRCL/PyPDNS"
license=('BSD')
source=("${_pyname}-${pkgver}.tar.gz::https://github.com/CIRCL/PyPDNS/archive/v${pkgver}.tar.gz")
sha512sums=('02fdfd696ae1698e27e56b1c31385a74f1db6e249af5903fd36567cf8912c428e333515ee9db3d717f9fd640a3ebc6be38133a4f3e7fbbaea2f2a335f7c686ee')

package_python-pypdns() {
  depends=('python')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-pypdns() {
  depends=('python2')
  cd "${srcdir}/${_pyname}-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}

# vim:set et sw=2 ts=2 tw=79:
