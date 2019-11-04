# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=affine
pkgname=python-${_pkgname}
pkgver=2.3.0
pkgrel=1
pkgdesc="Python package for matrices describing affine transformation of the plane"
url="https://github.com/sgillies/affine"
makedepends=('python-setuptools')
depends=('python')
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('2e045def1aa29e613c42e801a7e10e0b9bacfed1a7c6af0cadf8843530a15102')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
   python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
