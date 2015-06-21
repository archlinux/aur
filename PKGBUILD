# Maintainer:  <clu@eeviac>

pkgname=ophis
_pkgname=Ophis
pkgver=2.1
pkgrel=1
epoch=
pkgdesc="An assembler for the 6502 microprocessor"
arch=('i686' 'x86_64')
url="http://michaelcmartin.github.io/Ophis/"
license=('MIT')
groups=()
depends=('python2')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/michaelcmartin/${pkgname}/archive/v${pkgver}.tar.gz)
sha1sums=('3cab892b4347fcd398676d6adc36340f847632cc')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}/src
  
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/src

  python2 setup.py install --root=${pkgdir} --optimize=1
}
