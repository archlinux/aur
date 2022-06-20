# Maintainer: Misha <mishakmak@gmail.com>

pkgname=algorand-devtools-bin
pkgver=3.7.2
pkgrel=1
pkgdesc="Development tools for the Algorand blockchain"
arch=('x86_64')
url="https://www.algorand.com"
license=('AGPL3')
depends=("algorand")
provides=("algorand-devtools")
conflicts=("algorand-devtools")
source=("https://github.com/algorand/go-algorand/releases/download/v3.7.2-stable/algorand-devtools-3.7.2-1.x86_64.rpm")
sha256sums=('73bde35f5f66e09011c0026b2031e4d21146999c79c9ecb29ee9ccbd87c27ec0')

package(){
	cd "${srcdir}"
	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
}
