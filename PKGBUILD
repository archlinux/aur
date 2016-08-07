# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=usbdump
pkgver=1.0
pkgrel=1
pkgdesc="simple usbmon frontend"
url="http://biot.com/usbdump/"
license=("GPL3")
arch=('i686' 'x86_64')
depends=('glibc')
source=("http://biot.com/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('4ed0627e3f7afeb471f975569351ab8c')

build() {
  cd $srcdir/$pkgname-$pkgver
  make usbdump
}

package() {
  install -Dm755 $srcdir/$pkgname-$pkgver/usbdump $pkgdir/usr/bin/usbdump
}
