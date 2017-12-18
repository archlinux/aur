pkgname='python-pathvalidate'
_module='pathvalidate'
pkgver='0.16.2'
pkgrel=1
pkgdesc="A Python library to validate/sanitize a string such as filenames/variable-names/excel-sheet-names."
url="https://github.com/thombashi/pathvalidate"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://github.com/thombashi/pathvalidate/archive/v${pkgver}.tar.gz")
md5sums=('083344c144ed3ebe0e7d82731c2ddbf7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
