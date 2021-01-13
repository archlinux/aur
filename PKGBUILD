# Maintainer: dllud <dllud riseup net>

pkgname=grin-wallet-bin
pkgver=5.0.2
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
sha256sums=('8e86a9e07e10507e30cf562af5d340fb0793f54c30d950ecc1dff7c1ac52b81d')

package() {
    install -Dm755 -t "${pkgdir}/usr/bin" "${srcdir}/grin-wallet/grin-wallet"
}
