# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pyocr"
_pkgname="pyocr"
pkgver="0.5"
pkgrel="1"
pkgdesc="A Python wrapper for OCR engines (Tesseract, Cuneiform, etc)"
url="https://github.com/jflesch/pyocr"
depends=('python' )
makedepends=('python' 'python-setuptools')
license=('GPL3')
arch=('any')
changelog="ChangeLog"
source=("https://github.com/jflesch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('51da4f714e8badda047834d050628bc5')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
