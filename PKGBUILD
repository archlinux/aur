# Maintainer: Harry Jeffery <harry|@|exec64|.|co|.|uk>

pkgname=libnexus
pkgver=4.3.1
pkgrel=2
pkgdesc="libnexus provides functionality for loading/saving the nexus file format for scientific data"
url="http://www.nexusformat.org/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('hdf5')
optdepends=('hdf4: hdf4 file format support')
source=("http://download.nexusformat.org/kits/${pkgver}/nexus-${pkgver}.tar.gz")
sha1sums=('ed75a442acad8bc14745df42822286fb735ed526')

build() {
  cd "${srcdir}/nexus-${pkgver}"
  ./configure --prefix="${pkgdir}/usr"
  make
}

package() {
  cd "${srcdir}/nexus-${pkgver}"
  make install
}

# vim:set ts=2 sw=2 et:
