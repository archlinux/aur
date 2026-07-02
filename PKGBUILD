pkgname=orbolay-bin
pkgver=3.5.0
pkgrel=1
pkgdesc="Quick, small, native Discord overlay alternative for modded clients"
arch=('x86_64')
url="https://github.com/SpikeHD/Orbolay"
license=('GPL3')
provides=('orbolay')
conflicts=('orbolay')
source=(
    "https://github.com/SpikeHD/Orbolay/releases/download/v${pkgver}/orbolay-x86_64-unknown-linux-gnu"
    orbolay.desktop
    )
sha256sums=('f386122a9bbaa00190751a5f2d4cca79d65b7c5f430209cc372fa833374490ab'
            'cc5613c5d0da99342e8ffb87d9949180b0feeac81bc1550ca6bae1bc10598f4b')

package() {
    install -Dm644 "${srcdir}/orbolay.desktop" "${pkgdir}/usr/share/applications/orbolay.desktop"
    install -Dm755 "${srcdir}/orbolay-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/orbolay"
}
