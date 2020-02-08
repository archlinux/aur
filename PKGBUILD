# Maintainer: Martin Wimpress <code@flexion.org>

_pkgname=fastimport
pkgname=python2-fastimport
pkgver=0.9.8
pkgrel=1
pkgdesc="VCS fastimport/fastexport parser"
arch=(any)
url="https://pypi.python.org/pypi/fastimport/"
license=('GPL')
depends=('python2')
makedepends=('python2-distutils-extra')
source=("https://pypi.io/packages/source/f/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('85a206e92e209937a8dd11ffe8139cf9')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
