# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rst2gemtext
pkgver=0.3.0
pkgrel=1
pkgdesc='Converts reStructuredText to Gemtext (Gemini markup format)'
arch=('any')
url="https://github.com/flozz/rst2gemtext"
license=('GPL3')
depends=('python>=3.7' 'python-docutils' 'python-pygments' 'python-setuptools' 'python-importlib-metadata')
options=('zipman')
provides=(FLOZz)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f11601f0f14edb2b804617a1c51ede477f7f3fbf7a0cba882c771e854f0eede8')
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}