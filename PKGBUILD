# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>

pkgname=libmacspoof
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple library to preload for spoofing the mac address"

license=("unknown")
source=("ioctl_preload.64b.c"
	"Makefile")
md5sums=('23341bdb5ca2d928d67ba8cf1e3c9ada'
         '5cf8006342e32d40e86217a4fc444832')
arch=("any")
makedeps=("make")
depends=()
url="http://fringe.davesource.com/Fringe/Hacking/Hacks/MAC_Spoofing/"

function build() {
	make
}

function package() {
	mkdir -p "$pkgdir/usr/lib/"
	install libmacspoof.so.1.0.1 -m664 "$pkgdir/usr/lib/libmacspoof.so.1.0.1"
}
