# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=liblwipv6-dev
pkgver=1.5a
pkgrel=2
pkgdesc="User level (lightweight) TCP/IP stack with IPv6 support (dev files)"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/view-os"
license=('GPL2')
depends=('liblwipv6')
makedepends=('autoconf' 'automake' 'make' 'libtool')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://ftp.us.debian.org/debian/pool/main/l/lwipv6/liblwipv6-dev_1.5a-2_amd64.deb")
md5sums=("014a0b5ebb86aa9f676eb776fa7772ef")

package() {
   cd $srcdir
   mkdir -p ${pkgdir}/usr
   tar -xf data.tar.gz
   cp -r usr/share ${pkgdir}/usr/
   cp -r usr/include ${pkgdir}/usr/
}
