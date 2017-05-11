# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=swet
pkgver=1.5.16
pkgrel=1
pkgdesc="cpu/ram benchmark tool"
arch=('i686' 'x86_64')
url="http://swet.sourceforge.net/"
license=('GPL')
source=(http://sourceforge.net/projects/swet/files/swet-${pkgver}-src.tar.gz)
md5sums=('3643e0f222fd96082926615d4200a11d')

build() { 
  cd ${srcdir}/${pkgname}1
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}1
  install -Dm755 swet ${pkgdir}/usr/bin/swet
  install -Dm644 swet.1 ${pkgdir}/usr/share/man/man1/swet.1
}
