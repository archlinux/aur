# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>

pkgname=fon-flash
pkgver=0.1
pkgrel=1
pkgdesc="A new program based on AP51 flash, for flashing La Fonera and Atheros chipset compatible devices"
url=('http://www.gargoyle-router.com/wiki/doku.php?id=fon_flash')
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('libpcap')
source=("http://www.gargoyle-router.com/downloads/fon-flash/fon-flash-src.tar.gz")
md5sums=('dd84cd9e0965b73849c588e59c4f139a')
build () {
	cd "$srcdir/fon-flash-src"
	make fon-flash
}
package() {
	cd "$srcdir/fon-flash-src"
	mkdir -p "$pkgdir/usr/bin"
	cp fon-flash "$pkgdir/usr/bin/"
}
