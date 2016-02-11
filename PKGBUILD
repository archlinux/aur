# Maintainer: Athaudia <athaudia at gmail dot com>
pkgname=bin2tap
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="ZX Spectrum .bin to .tap converter"
arch=('i686' 'x86_64')
url="http://zeroteam.sk/bin2tap.html"
license=('unknown')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://zeroteam.sk/files/bin2tap13.zip")
noextract=()
md5sums=('08124a53e1452d978e1d3baca0eeba51')
validpgpkeys=()

build() {
	cd "$pkgname"
	gcc -O2 bin2tap.c -o "$pkgname"
}

package() {
	cd "$pkgname"
	mkdir -p $pkgdir/usr/bin/
	install "$pkgname" $pkgdir/usr/bin/
}
