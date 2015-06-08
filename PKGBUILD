# Maintainer: eolianoe <eolianoe At gmail DoT com>
pkgname=f90cache
pkgver=0.95
pkgrel=1
pkgdesc="Caching pre-processor for Fortran compilers"
arch=('i686' 'x86_64')
url="http://people.irisa.fr/Edouard.Canot/f90cache/"
license=('GPL')
source=("${url}/${pkgname}-${pkgver}.tar.bz2")
md5sums=('0389df22dbabf17adf77252b97603684')

build(){
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr

  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make install DESTDIR=${pkgdir}
}
