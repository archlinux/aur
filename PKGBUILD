# Maintainer: Fábio Muramatsu <fabio [dot] muramatsu [at] outlook [dot] com>
pkgname=multichain-bin
pkgver=alpha_22
pkgrel=1
pkgdesc="Open platform for building blockchains"
arch=('x86_64')
url="http://www.multichain.com/"
license=('GPL3')
depends=('gcc-libs>=6.0.0')
source=("http://www.multichain.com/download/multichain-1.0-alpha-22.tar.gz")

package() {
	cd "multichain-1.0-alpha-22"
	mkdir -p $pkgdir/usr/bin
	install multichaind multichain-cli multichain-util $pkgdir/usr/bin
}

md5sums=('0701a0d32e153dcb945f0240175124cd')
