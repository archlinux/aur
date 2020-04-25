# Maintainer: ReindeerFlotilla <clu@eeviac>

pkgname=python-fitsio
_pkgname=fitsio
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="A python package for FITS input/output wrapping cfitsio"
arch=('i686' 'x86_64')
url="https://github.com/esheldon/fitsio"
license=('GPL')
groups=()
depends=('python' 'python-numpy')
makedepends=('python-setuptools')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/esheldon/${_pkgname}/archive/v${pkgver}.tar.gz)
sha1sums=('a7097c60e21afba5cc8c80eeca2ebe95077166e6')
noextract=()


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}

