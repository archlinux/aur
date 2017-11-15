# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
pkgname=pcapfix
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="A tool of repairing your broken pcap and pcapng files"
arch=('any')
url="https://f00l.de/pcapfix/pcapfix-1.1.0.tar.gz"
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
source=("https://f00l.de/pcapfix/pcapfix-1.1.0.tar.gz")
noextract=()
md5sums=('baabfe913c399d626bec26042689ba38')
validpgpkeys=()
package() {
	mkdir -p $pkgdir/usr/bin
	cd $srcdir/pcapfix-1.1.0
	make
	mv $srcdir/pcapfix-1.1.0/pcapfix $pkgdir/usr/bin
}
