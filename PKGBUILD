# Maintainer: ReindeerFlotilla <clu@eeviac>

pkgname=python-fitsio
_pkgname=fitsio
pkgver=1.1.8
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
source=(https://github.com/esheldon/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha1sums=('3f2479f04f05bdfdfacd46307438110d64d4c049')
noextract=()


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}

