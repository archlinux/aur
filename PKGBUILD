# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

_realname=pyutil
pkgname=("python-${_realname}" "python2-${_realname}")
pkgver=2.1.0
pkgrel=1
pkgdesc="a collection of utilities for Python programmers"
depends=("python2")
makedepends=("python-setuptools" "python2-setuptools")
arch=("any")
url="https://pypi.org/project/pyutil/"
license=("GPL")
source=("https://pypi.python.org/packages/c6/f2/42e3c9f20c12030e94b6e8d8a3633760a898cfde7bdb4bf6218404da16ff/${_realname}-${pkgver}.tar.gz")
sha256sums=("30e9716eff6696536e4311dd0b369629c7b12400745eff48e940cc8aac422a25")


package_python-pyutil() {
    cd "${srcdir}/${_realname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    rm -rf "${pkgdir}/usr/pyutil"
}

package_python2-pyutil() {
    cd "${srcdir}/${_realname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    rm -rf "${pkgdir}/usr/pyutil"
}
