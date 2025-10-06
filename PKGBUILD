# Maintainer: Artemy Fedotov <catlovescpp@gmail.com>

pkgname=sjconv-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple standalone convolver for JACK."
arch=('x86_64')
url="https://github.com/fstxz/sjconv"
license=('MIT')
depends=('jack')
options=('!strip')
provides=('sjconv')
conflicts=('sjconv')
source=("https://github.com/fstxz/sjconv/releases/download/v${pkgver}/sjconv-v${pkgver}-linux-x86_64.zip")
sha256sums=('9c4a41a9aa1c77d4a745d3f18d7613d25bf7a77c4541ccfb29d79dd1e276ecc8')

package() {
    install -Dm755 "sjconv" "${pkgdir}/usr/bin/sjconv"
    install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
