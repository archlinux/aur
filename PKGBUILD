# Maintainer: Fábio Muramatsu <fabio [dot] muramatsu [at] outlook [dot] com>
pkgname=multichain-bin
pkgver=alpha_23
pkgrel=1
pkgdesc="Open platform for building blockchains"
arch=('x86_64')
url="http://www.multichain.com/"
license=('GPL3')
depends=('gcc-libs>=6.0.0')
source=("http://www.multichain.com/download/multichain-1.0-alpha-23.tar.gz")

package() {
	cd "multichain-1.0-alpha-23"
	mkdir -p $pkgdir/usr/bin
	install multichaind multichain-cli multichain-util $pkgdir/usr/bin
}


md5sums=('9aa75b0b6dbe7917705eaee1da718235')
