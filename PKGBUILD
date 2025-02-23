# Maintainer: Birdman <bn0010100@gmail.com>
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Misha <mishakmak@gmail.com>

pkgname=go-algorand-devtools
pkgver=4.0.2
pkgrel=1
pkgdesc="Development tools for the Algorand blockchain"
arch=('x86_64')
url="https://www.algorand.com"
license=('AGPL3')
depends=("go-algorand")
provides=("go-algorand-devtools")
conflicts=("go-algorand-devtools")
source=("https://github.com/algorand/go-algorand/releases/download/v${pkgver}-stable/algorand-devtools-${pkgver}-1.x86_64.rpm")
sha384sums=('616ea45a5d571da2fee1de11f4711805dac2ca47cffd80a18a1290ff5f88be505ee69080a766198592004726ac966ce7')

package() {
  cd "${srcdir}"
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
}
