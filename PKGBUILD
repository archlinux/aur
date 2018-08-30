# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>
pkgname='hocr-tools'
pkgver=1.2.0
pkgrel=1
pkgdesc='Tools for manipulating and evaluating the hOCR format for representing multi-lingual OCR results by embedding them into HTML.'
arch=(any)
url=https://github.com/tmbdev
license=(Apache)
depends=(python)
makedepends=(python-setuptools python-pillow python-lxml python-reportlab)

source=("${url}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0d3fb25e48b812afc7293b0e84bda68995ccdec627befe4607be5b79b82f508b')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}
