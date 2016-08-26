# Maintainer: M0Rf30

pkgname=zcd
pkgver=1.0.1
pkgrel=1
pkgdesc="ZCD stands for Zero Configuration Dispatchers. It is a framework for Remote Procedure Call."
arch=('i686' 'x86_64')
url="http://netsukuku.freaknet.org"
license=('GPL')
depends=(pth libgee vala tasklet) 
source=(http://mirror.lihnidos.org/GNU/savannah//netsukuku/${pkgname}-${pkgver}.tar.gz)

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make  
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
}
 
md5sums=('1beeea554ea73429e6d56dd373c375f7')
