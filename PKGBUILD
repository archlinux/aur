# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=python-ly
pkgver=0.9.3
pkgrel=1
pkgdesc="Python modules to parse, manipulate or create documents in LilyPond format."
arch=('any')
url="https://github.com/wbsoft/python-ly"
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://github.com/wbsoft/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('3c3a43a23a444ba016e0c630b3663dc542a9cc032ea047e7ed6633319b296da8')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
