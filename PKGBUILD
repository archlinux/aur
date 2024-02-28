# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Misha <mishakmak@gmail.com>

pkgname=algorand-devtools-bin
pkgver=3.22.0
pkgrel=1
pkgdesc="Development tools for the Algorand blockchain"
arch=('x86_64')
url="https://www.algorand.com"
license=('AGPL3')
depends=("algorand")
provides=("algorand-devtools")
conflicts=("algorand-devtools")
source=("https://github.com/algorand/go-algorand/releases/download/v${pkgver}-stable/algorand-devtools-${pkgver}-1.x86_64.rpm")
sha384sums=('9b430d40650cdd569208cc01c2f1f18804dfda70ff19a8866cf026c7269c63c61ae7d9260d52ae3a75447bb508f96060')

package(){
	cd "${srcdir}"
	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
}
