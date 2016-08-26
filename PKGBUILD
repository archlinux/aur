# Maintainer: M0Rf30

pkgname=tasklet
pkgver=1.0.1
pkgrel=1
pkgdesc="A library aimed to make it easy to implement spawnable class methods in the Vala language"
arch=('i686' 'x86_64')
url="http://netsukuku.freaknet.org"
license=('GPL')
depends=(pth libgee vala)
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
 
md5sums=('902277148cbaa969eacc7157613fa597')
