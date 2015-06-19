# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=python2-oerplib
_realpkgname=OERPLib
pkgver=0.8.0
pkgrel=1
pkgdesc="Python module providing an easy way to pilot your OpenERP and Odoo servers through RPC"
arch=('any')
url="https://pypi.python.org/pypi/OERPLib"
license=('LGPL3')
depends=('python2')
source=("http://pypi.python.org/packages/source/O/${_realpkgname}/${_realpkgname}-${pkgver}.tar.gz")
md5sums=('4a1efe490c03fb04a992066dbd45a7e0')

build() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  python2 setup.py install --root "${pkgdir}" -O1
}

# vim:set ts=2 sw=2 et:
