# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=affine
pkgname=python-${_pkgname}
pkgver=2.3.1
pkgrel=1
pkgdesc="Python package for matrices describing affine transformation of the plane"
url="https://github.com/sgillies/affine"
makedepends=('python-setuptools')
depends=('python')
optdepends=()
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/a/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('d676de66157ad6af99ffd94e0f54e89dfc35b0fb7252ead2ed0ad2dca431bdd0')

build() {
    cd "$srcdir/${_pkgname}-$pkgver"
   python setup.py build
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
