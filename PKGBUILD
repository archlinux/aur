# Maintainer: David McInnis <davidm@eagles.ewu.edu>
# Contributer: Carl George < arch at cgtx dot us >

_name="traceback2"
pkgname=("python-traceback2")
pkgver="1.4.0"
pkgrel="2"
pkgdesc="Backports of the traceback module"
arch=("any")
url="https://github.com/testing-cabal/traceback2"
license=("PSF")
makedepends=("python-pbr" "python-linecache2" "python-six")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('05acc67a09980c2ecfedd3423f7ae0104839eccb55fc645773e1caa0951c3030')

package() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

