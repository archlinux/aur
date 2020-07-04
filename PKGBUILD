# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=4.0.0
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
sha256sums=('5a8762a7307243d8767962d23407bd74e38127ef9bd97c1c4a79b38655a23b7f')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet/grin-wallet"
}
