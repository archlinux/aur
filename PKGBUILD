# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=5.3.0
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
sha256sums=('d2cb010b6718cc468b9f1a00ded1bb7d3227c829ae77c03f0e5ef545e7c986aa')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet"
}
