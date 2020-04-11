# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=3.1.1
pkgrel=2
pkgdesc="Reference implementation of Grin's wallet."
arch=('x86_64')
url='https://github.com/mimblewimble/grin-wallet'
license=('Apache')
optdepends=('tor: for immediate transactions through Tor anonymizing network')
conflicts=('grin-wallet')
provides=('grin-wallet')
options=(!strip)
source=("https://github.com/mimblewimble/grin-wallet/releases/download/v${pkgver}/grin-wallet-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('4fa55924078df6a5feab3fc07cd07f399f3891f40c37f95f5818e4eab40c77f3')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet/grin-wallet"
}
