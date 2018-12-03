# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=pcapfix
pkgver=1.1.3
pkgrel=1
epoch=
pkgdesc="A tool of repairing your broken pcap and pcapng files"
arch=('any')
url="https://f00l.de/pcapfix/pcapfix-1.1.3.tar.gz"
license=('GPL3')
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
source=("https://f00l.de/pcapfix/pcapfix-1.1.3.tar.gz")
noextract=()
md5sums=('97b1c7d23ac89c4f78b9716fd2f56871')
validpgpkeys=()
package() {
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/pcapfix-1.1.3
	make
	mv $srcdir/pcapfix-1.1.3/pcapfix $pkgdir/usr/bin
}
