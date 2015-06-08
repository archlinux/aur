# Maintainer: eolianoe <eolianoe At GMAIL DoT com>
pkgname=makedepf90
pkgver=2.8.8
pkgrel=3
pkgdesc='Automatic creation of Makefile dependency lists for Fortran source code'
arch=('i686' 'x86_64')
url="http://personal.inet.fi/private/erikedelmann/makedepf90/"
license=('GPL')
makedepends=('flex' 'bison')
source=("http://personal.inet.fi/private/erikedelmann/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('283bf10e57d9d3571a77a1f9422def2ee435245d6d4c472d32d78f1462cb6d85')
#source=("http://ftp.debian.org/debian/pool/main/m/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz")
#sha256sums=('a5118aea198219f59bc04eab0a2099341cecac76a7029c2aef72141645e7596a')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=${pkgdir}/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make install
}

# vim:set ts=2 sw=2 et:
