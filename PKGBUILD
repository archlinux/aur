# Maintainer: Carl George < arch at cgtx dot us >

_name="linecache2"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Backports of the linecache module"
arch=("any")
url="https://github.com/testing-cabal/${_module}"
license=("Python")
makedepends=("python-pbr" "python2-pbr")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4b26ff4e7110db76eeb6f5a7b64a82623839d595c2038eeda662f2a2db78e97c')

package_python-linecache2() {
    depends=("python")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-linecache2() {
    depends=("python2")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
