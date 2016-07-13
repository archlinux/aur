# Maintainer: Fábio Muramatsu <fabio [dot] muramatsu [at] outlook [dot] com>
pkgname=multichain-bin
pkgver=alpha_21
pkgrel=1
pkgdesc="Open platform for building blockchains"
arch=('x86_64')
url="http://www.multichain.com/"
license=('GPL3')
depends=('gcc-libs>=6.0.0')
source=("http://www.multichain.com/download/multichain-1.0-alpha-21.tar.gz")

package() {
	cd "multichain-1.0-alpha-21"
	mkdir -p $pkgdir/usr/bin
	install multichaind multichain-cli multichain-util $pkgdir/usr/bin
}
md5sums=('43314e5e3bcd38c4b4c0ec43d2ba76fe')
