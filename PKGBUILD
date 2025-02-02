# Maintainer: Matthias Fulz <mfulz@olznet.de>

_pkgname=pyhy
pkgname=python-$_pkgname
pkgver=0.0.9
pkgrel=1
pkgdesc="Python bindings for libhydrogen"
arch=('any')
url="https://github.com/someburner/pyhy"
license=('custom:ISC')
depends=('python' 'python-setuptools' 'libhydrogen')
source=("${_pkgname}-v${pkgver}.tar.gz::https://github.com/someburner/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('235fc487c1175c5e4f608932a4566e0ca392bb6870f3a3b2740db2eee15da846')

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir"
}
