# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=5.5.1
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
sha256sums=('b2e9b12e6771c8731bc5c06e097078d51cf9070bd1aeee33a77121115c585716')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet"
}
