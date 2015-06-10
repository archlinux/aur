# Maintainer: Francois Boulogne <fboulogne@april.org>

pkgname=python2-pyocr
pkgver=0.3.0
pkgrel=1
pkgdesc='Optical character recognition (OCR) tool wrapper for python'
arch=('any')
url='https://github.com/jflesch/pyocr'
license=('GPL3')
provides=('python2-pyocr')
conflicts=('python2-pyocr')
depends=('python2-pillow' 'tesseract')
makedepends=('python2' 'python2-setuptools')
optdeps=('cuneiform: alternativer OCR')
source=("https://github.com/jflesch/pyocr/archive/v${pkgver}.zip")

build() {
  cd "pyocr-${pkgver}"
  python2 setup.py build
}

package() {
  cd "pyocr-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
# vim:ts=2:sw=2:et:
sha256sums=('74b7bc84db345fbd316adf54815e16a01bc697f2f3f08c901b7a9aca2cdb8c30')
