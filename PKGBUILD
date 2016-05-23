# Maintainer: Francois Boulogne <fboulogne@april.org>

pkgname=python2-pyocr
pkgver=0.4.1
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
source=("https://github.com/jflesch/pyocr/archive/${pkgver}.zip")

build() {
  cd "pyocr-${pkgver}"
  python2 setup.py build
}

package() {
  cd "pyocr-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}
# vim:ts=2:sw=2:et:
sha256sums=('372e47561133930eaf9007a532c4e4841e8a7c749a9dce820f713981854a0b0a')
