# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=python-ly
pkgver=0.9.5
pkgrel=1
pkgdesc="Python modules to parse, manipulate or create documents in LilyPond format."
arch=('any')
url="https://github.com/wbsoft/python-ly"
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://github.com/wbsoft/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('11d2eb5c0f8726d4d8b48bfd104ba30bee1d3c64915028e6710e6e239d1f4c1f')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
