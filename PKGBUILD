# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Misha <mishakmak@gmail.com>

pkgname=algorand-devtools-bin
pkgver=3.19.0
pkgrel=1
pkgdesc="Development tools for the Algorand blockchain"
arch=('x86_64')
url="https://www.algorand.com"
license=('AGPL3')
depends=("algorand")
provides=("algorand-devtools")
conflicts=("algorand-devtools")
source=("https://github.com/algorand/go-algorand/releases/download/v${pkgver}-stable/algorand-devtools-${pkgver}-1.x86_64.rpm")
sha384sums=('913c3353acfb6411b4d16a17e5156eb94fb00492b34fccb5de08ce82a308fef24559813abd0d5d8fb92ec0abab812a50')

package(){
	cd "${srcdir}"
	install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
}
