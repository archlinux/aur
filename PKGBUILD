# Maintainer: Fabien Dubosson <fabien.dubosson@gmail.com>

pkgname="python-pyocr"
_pkgname="pyocr"
pkgver="0.4.2"
pkgrel="1"
pkgdesc="A Python wrapper for OCR engines (Tesseract, Cuneiform, etc)"
url="https://github.com/jflesch/pyocr"
depends=('python' )
makedepends=('python' 'python-setuptools')
license=('GPL3')
arch=('any')
changelog="ChangeLog"
source=("https://github.com/jflesch/${_pkgname}/archive/${pkgver}.tar.gz")
md5sums=('a6baa1339574cbfd33ddeb0cdc104cdf')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
}
