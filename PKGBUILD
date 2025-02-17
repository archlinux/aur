# Maintainer: Birdman <bn0010100@gmail.com>
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>
# Contributor: Misha <mishakmak@gmail.com>

pkgname=go-algorand-devtools
pkgver=4.0.1
pkgrel=1
pkgdesc="Development tools for the Algorand blockchain"
arch=('x86_64')
url="https://www.algorand.com"
license=('AGPL3')
depends=("go-algorand")
provides=("go-algorand-devtools")
conflicts=("go-algorand-devtools")
source=("https://github.com/algorand/go-algorand/releases/download/v${pkgver}-stable/algorand-devtools-${pkgver}-1.x86_64.rpm")
sha384sums=('b72f9eb3a8ab83a4906ec73ebe1ac0509c68e77eaff8be9e7d161a7f04cfa73a152ff79a7acbc271e379724b4222c9cc')

package() {
  cd "${srcdir}"
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin/"
}
