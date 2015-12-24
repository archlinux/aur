# Maintainer: M0Rf30

pkgname=ntkmonitor
pkgver=1.0.1
pkgrel=1
pkgdesc="Netsukuku monitor"
arch=('i686' 'x86_64')
url="http://netsukuku.freaknet.org"
license=('GPL')
depends=(libgee vala zcd netsukuku-rpc andns-rpc ntkresolv)
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
 
md5sums=('bc86d4f30a9d770f5e5308732b54a6eb')
