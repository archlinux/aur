# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=5.4.1
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
sha256sums=('499401d73aeee7a7dbe705b288c208d012440b539e0ae574adebf984d3de512a')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet"
}
