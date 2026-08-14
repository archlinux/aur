# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=5.5.0
pkgrel=1
pkgdesc="Reference implementation of Grin's wallet."
arch=('x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
conflicts=('grin-wallet')
provides=('grin-wallet')
options=(!strip)
source=("https://github.com/mimblewimble/grin-wallet/releases/download/v${pkgver}/grin-wallet-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('5d625e941985da15c96cdbb1f8412e2227e7a3ff024d45cb5939aae2111a2de4')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet"
}
