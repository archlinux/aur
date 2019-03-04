# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=pcapfix
pkgver=1.1.4
pkgrel=1
epoch=
pkgdesc="A tool of repairing your broken pcap and pcapng files"
arch=('any')
url="https://f00l.de/pcapfix/pcapfix-1.1.4.tar.gz"
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
source=("https://f00l.de/pcapfix/pcapfix-1.1.4.tar.gz")
noextract=()
md5sums=('0832151f96121d5099bc256028cd0a7d')
validpgpkeys=()
package() {
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/pcapfix-1.1.4
	make
	mv $srcdir/pcapfix-1.1.4/pcapfix $pkgdir/usr/bin
}
