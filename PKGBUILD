# Maintainer: David McInnis <davidm@eagles.ewu.edu
# Contributer: Carl George < arch at cgtx dot us >

_name="linecache2"
pkgname=("python-linecache2")
pkgver="1.0.0"
pkgrel="2"
pkgdesc="Backports of the linecache module"
arch=("any")
url="https://github.com/testing-cabal/${_module}"
license=("PSF")
makedepends=("python-pbr")
#checkdepends=("python-unittest2" "python-pytest) CIRCULAR DEPENDENCY
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4b26ff4e7110db76eeb6f5a7b64a82623839d595c2038eeda662f2a2db78e97c')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
