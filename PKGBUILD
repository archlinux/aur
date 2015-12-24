# Maintainer: M0Rf30

pkgname=andns-rpc
pkgver=1.0.1
pkgrel=1
pkgdesc="Netsukuku ANDNS"
arch=('i686' 'x86_64')
url="http://netsukuku.freaknet.org"
license=('GPL')
depends=(libgee vala zcd netsukuku-rpc)
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
 
md5sums=('36fbc472d868d07353c9d885e047c9f5')
