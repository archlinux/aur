# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=3.1.2
pkgrel=1
pkgdesc="Reference implementation of Grin's wallet."
arch=('x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
conflicts=('grin-wallet')
provides=('grin-wallet')
options=(!strip)
source=("https://github.com/mimblewimble/grin-wallet/releases/download/v${pkgver}/grin-wallet-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('3f980b17303ed42db14b5b8949a2767e76908cc9b47ff566c5305506f8063b69')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet/grin-wallet"
}
