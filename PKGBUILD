# Maintainer: ReindeerFlotilla <clu@eeviac>

pkgname=python-fitsio
_pkgname=fitsio
pkgver=1.0.4
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
sha1sums=('5af5733e90c168349ed472c4239833f99b1c500c')
noextract=()


build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python setup.py install --root=${pkgdir} --optimize=1
}

