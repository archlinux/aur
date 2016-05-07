# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=python-ly
pkgver=0.9.4
pkgrel=1
pkgdesc="Python modules to parse, manipulate or create documents in LilyPond format."
arch=('any')
url="https://github.com/wbsoft/python-ly"
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://github.com/wbsoft/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b847dcc2371beb63df2bd85350956a43c05873e1a8656b79b21e3e6f979a856d')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
