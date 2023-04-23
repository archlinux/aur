# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Co-Maintainer: FLOZz <aru at flogisoft dot com>
pkgname=rst2gemtext
pkgver=0.3.1
pkgrel=1
pkgdesc='Converts reStructuredText to Gemtext (Gemini markup format)'
arch=('any')
url="https://github.com/flozz/rst2gemtext"
license=('GPL3')
depends=('python>=3.7' 'python-setuptools' 'python-importlib-metadata')
options=('zipman')
provides=(FLOZz)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0a5b5924cf229180ce52dd5e0a1a7c453f811a05b7ac820b506a329ebeb942c9')
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
