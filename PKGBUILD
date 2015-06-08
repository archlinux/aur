# Maintainer: Carl George < arch at cgtx dot us >

_name="cmd2"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.6.8"
pkgrel="2"
pkgdesc="Extra features for standard library's cmd module"
arch=("any")
url="https://bitbucket.org/catherinedevlin/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('ac780d8c31fc107bf6b4edcbcea711de4ff776d59d89bb167f8819d2d83764a8')

package_python-cmd2() {
    depends=("python-pyparsing>=2.0.1")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-cmd2() {
    depends=("python2-pyparsing>=2.0.1")
    cd "${srcdir}/${_name}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
