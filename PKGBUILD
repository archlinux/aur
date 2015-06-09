# Maintainer: Pierre Bourdon <delroth@gmail.com>

pkgname=netboot
pkgver=20100119
pkgrel=1
pkgdesc="a simple PXE-compatible DHCP and TFTP server"
arch=(i686 x86_64)
url="http://brokestream.com/netboot.html"
license=(BSD)
depends=(glibc)
makedepends=(gcc)
source=(http://brokestream.com/netboot.c)

build() {
     cd $srcdir
     gcc -o netboot netboot.c || return 1
     install -D -m755 netboot "$pkgdir/usr/bin/netboot" || return 1
}
md5sums=('e702d33f4fbae8836218b0753348fd02')
