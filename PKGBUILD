# Maintainer: Parth Nobel <parthnobel AT gmail DOT com>

pkgname=("python-auto_diff")
pkgdesc="An automatic differentiation library for Python+NumPy."
pkgver="0.3.2"
pkgrel=1
url="https://github.com/PTNobel/AutoDiff"
license=('BSD')
arch=('any')
source=("https://github.com/PTNobel/AutoDiff/archive/v${pkgver}.tar.gz")
sha256sums=('2be536c6bd943b5acec29a2e7e0f83a18dd92cee0aa0c889cfdd47cb61567fb9')
build() {
    cd "AutoDiff-$pkgver"
    python setup.py build
}

package(){
    cd "AutoDiff-$pkgver"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
