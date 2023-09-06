# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Misha <mishakmak@gmail.com>

pkgname=algorand-devtools-bin
pkgver=3.17.0
pkgrel=1
pkgdesc="Development tools for the Algorand blockchain"
arch=('x86_64')
url="https://www.algorand.com"
license=('AGPL3')
depends=("algorand")
provides=("algorand-devtools")
conflicts=("algorand-devtools")
source=("https://github.com/algorand/go-algorand/releases/download/v${pkgver}-stable/algorand-devtools-${pkgver}-1.x86_64.rpm")
sha384sums=('00eae613878437fb800755c00f8022154daab267c691b00117ee3a21fd0daeacd07f2a4033f4d6caa0c65a276b7af316')

package(){
	cd "${srcdir}"
	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
}
