# Maintainer: adrien Prost-Boucle <adrien.prost-boucle.@laposte.net>

pkgname=vhd2vl-git
pkgver=2.5
pkgrel=1

pkgdesc="Translate synthesizable VHDL into Verilog 2001"
arch=('i686' 'x86_64')
url="http://doolittle.icarus.com/~larry/vhd2vl/"
license=('GPLv2')
makedepends=('git')

source=("git://github.com/ldoolitt/vhd2vl.git")
md5sums=('SKIP')

build() {
	cd  "$srcdir/vhd2vl/src"

	make PREFIX=/usr

}

package() {
	cd "$srcdir/vhd2vl/src"

	install -D vhd2vl ${pkgdir}/usr/bin/vhd2vl

}
