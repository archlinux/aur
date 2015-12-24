# Maintainer: M0Rf30

pkgname=ntkresolv
pkgver=1.0.1
pkgrel=1
pkgdesc="Netsukuku resolver"
arch=('i686' 'x86_64')
url="http://netsukuku.freaknet.org"
license=('GPL')
depends=(libgee vala zcd andns-rpc)
source=(http://mirror.lihnidos.org/GNU/savannah//netsukuku/${pkgname}-${pkgver}.tar.gz)

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sbindir=/usr/bin
  make  
}

package() {
  cd $srcdir/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install -i
}
 
md5sums=('bdb5071769af4c10566e3cb3adb39038')
