# Maintainer: ReindeerFlotilla <clu@eeviac>

pkgname=python-fitsio
_pkgname=fitsio
pkgver=0.9.12
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
sha1sums=('21835683c429e105f4a3858e46fa7a3b1577be2d')
noextract=()


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}

