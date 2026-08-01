# Maintainer: Connor Etherington <connor@agentics.co.za>
# ---
pkgname=agentics-companion
pkgver=0.1.79
pkgrel=1
pkgdesc="Agentics Companion - the local relay and voice daemon that links every Agentics surface to the hub"
arch=('x86_64')
url="https://agentics.co.za"
license=('custom')
depends=()
options=('!strip' '!debug')
source=("agentics-companion-0.1.79-x86_64::https://repo.agentics.co.za/x86_64/agentics-companion-0.1.79-x86_64")
sha512sums=('736ff3def7e15370185f22412152d9485b02cbb019390826a1de856418dfd140303cd5e9c64d7175276bfe410bb811bede5d8026793994760979b9981c33f55c')

package() {
  install -Dm755 "$srcdir/agentics-companion-0.1.79-x86_64" "$pkgdir/usr/bin/agentics-companion"
}
