pkgname=orbolay-bin
pkgver=0.1.0.alpha7
_tag=0.1.0-alpha7
pkgrel=2
pkgdesc="Quick, small, native Discord overlay alternative for modded clients"
arch=('x86_64')
url="https://github.com/SpikeHD/Orbolay"
license=('GPL3')
provides=('orbolay')
conflicts=('orbolay')
source=(
    "https://github.com/SpikeHD/Orbolay/releases/download/v${_tag}/orbolay-x86_64-unknown-linux-gnu"
    orbolay.desktop
    )
sha256sums=(
    '7bc2c09c3f8a1a9083a37ecd6689fea83aae4bcedcd9da3af97386fc9ecd014d'
    'cc5613c5d0da99342e8ffb87d9949180b0feeac81bc1550ca6bae1bc10598f4b'
    )

package() {
    install -Dm644 "${srcdir}/orbolay.desktop" "${pkgdir}/usr/share/applications/orbolay.desktop"
    install -Dm755 "${srcdir}/orbolay-x86_64-unknown-linux-gnu" "${pkgdir}/usr/bin/orbolay"
}
