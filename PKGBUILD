# Maintainer: Jozef Riha <jose1711@gmail.com>

pkgname=tcpconsole
arch=('i686')
pkgver=0.3
pkgrel=1
license=('GPL')
pkgdesc="a network emergency console for Linux which uses lowlevel Linux system calls"
url="http://www.vanheusden.com/tcpconsole/"
depends=('glibc')
source=("http://www.vanheusden.com/tcpconsole/${pkgname}-${pkgver}.tgz")
md5sums=('e421db98fe317b573e739d7e9dc5da4f')
install=('tcpconsole.install')
build() {
cd $srcdir/$pkgname-$pkgver
make
}

package() {
install -D -m755 $srcdir/$pkgname-$pkgver/tcpconsole $pkgdir/usr/bin/tcpconsole
}
