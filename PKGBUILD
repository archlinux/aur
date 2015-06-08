# Maintainer: Carl George < arch at cgtx dot us >

_name="cliff-tablib"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.1"
pkgrel="3"
pkgdesc="tablib formatters for cliff"
arch=("any")
url="https://github.com/dreamhost/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4a8ed81f6678e76d0e0497f2708d0fe5d2b83ec442a03f982aaa711a08c74139')

package_python-cliff-tablib() {
    depends=("python-cliff" "python-tablib")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-cliff-tablib() {
    depends=("python2-cliff" "python2-tablib")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
