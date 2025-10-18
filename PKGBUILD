# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=5.3.3
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
sha256sums=('398b27c9aafcccf4563658e9eef1f20b75e28e2f1b515cd6a251d890af77106e')

package() {
  install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet"
}
