# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=5.1.0
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
sha256sums=('aaf0d6b658d1756289bccae82cfea3e084de1bec11d47e86f3254cbe80a3cc60')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet/grin-wallet"
}
