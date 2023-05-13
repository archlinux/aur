# Maintainer: atomicfs
pkgname=python-blkinfo
pkgver=0.2.0
pkgrel=2
pkgdesc="A python library to list information about all available or the specified block devices"
arch=('any')
url="https://github.com/grinrag/blkinfo"
license=('GPL3')
depends=('python' 'util-linux')
_pkgname=blkinfo
source=("${pkgname}::git+https://github.com/genalt/${_pkgname}#tag=${pkgver}")
sha256sums=('SKIP')

package() {
        cd "${srcdir}/${pkgname}"
        python setup.py install --root="${pkgdir}" --optimize=1
}
